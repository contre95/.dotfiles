from collections import OrderedDict, namedtuple
import json
import subprocess as sp

import lemonbar_manager


PADDING = ' '  # Padding


def get_monitor_info(monitor_name):
    """Get the inital location of each window (monitor/desktop).

    Parameters:
        monitor_name (str): The monitor name to look for windows.

    Returns:
        tuple: A tuple containing two dictionaries. The first dictionary
        contains a mapping of monitor names and window IDs. The second
        dictionary contains a mapping of desktop names and window IDs.
    """
    def parse_clients_subtree(root, clients=None):
        """Parse a subsection of the BSPC dump to extract window IDs.

        Returns:
            list: A list of window IDs.
        """
        if root is None:
            root = {'client': None, 'firstChild': None, 'secondChild': None}

        if clients is None:
            clients = []

        if root['client'] is not None:
            clients.append(root['id'])

        for child in ('firstChild', 'secondChild'):
            if root[child] is not None:
                parse_clients_subtree(root[child], clients)

        return clients

    tree = json.loads(sp.run(['bspc', 'wm', '-d'], capture_output=True).stdout)

    monitor_id = None
    focused_desktop = None
    desktop_windows = {}

    for monitor in tree['monitors']:
        if monitor['name'] != monitor_name:
            continue

        monitor_id = monitor['id']
        focused_desktop = monitor['focusedDesktopId']

        for desktop in monitor['desktops']:
            desktop_id = desktop['id']
            #desktop_name = desktop['name']
            desktop_windows[desktop_id] = []

            clients = parse_clients_subtree(desktop['root'])

            for client in clients:
                desktop_windows[desktop_id].append(client)

    MonitorInfo = namedtuple(
        'MonitorInfo', ['monitor_id', 'focused_desktop', 'windows_by_desktop'])

    return MonitorInfo(monitor_id, focused_desktop, desktop_windows)


class Tags(lemonbar_manager.Module):
    def __init__(self, monitor):
        """A BSPWM desktop indicator.

        Parameters:
            monitor (str): The name of the monitor to show the desktop status
                for.
        """
        super().__init__()

        self.readables = [
            sp.Popen(
                ['bspc', 'subscribe', 'report'],
                stdout=sp.PIPE, bufsize=0).stdout
        ]

        self._monitor = monitor

        # The format strings use to display the stauts of the desktops
        self._formats = {
            'O': ('%{B#333}', '%{-u}%{B-}'),          # Focused, Occupied
            'F': ('%{B#333}%{F#000}', '%{F-}%{B-}'),  # Focused, Free
            'U': ('%{B#CF6A4C}', '%{B-}'),            # Focused, Urgent

            'o': ('', ''),                  # Unfocused, Occupied
            'f': ('%{F#333}', '%{F-}'),     # Unfocused, Free
            'u': ('%{B#CF6A4C}', '%{B-}'),  # Unfocused, Urgent
        }

    def _parse_event(self, event):
        """Parse a BSPWM event.

        Parameters:
            event (str): The BSPWM event.

        Returns:
            OrderedDict: Keys are desktop names, values are the status.
        """
        desktops = OrderedDict()

        event = event.lstrip('W')
        items = event.split(':')

        on_monitor = False

        for item in items:
            k, v = item[0], item[1:]

            if k in 'Mm':
                on_monitor = v == self._monitor
            elif on_monitor and k in 'OoFfUu':
                desktops[v] = k

        return desktops

    def output(self):
        event = self.readables[0].readline().decode('utf-8').strip()
        desktops = self._parse_event(event)

        output = []
        for desktop, state in desktops.items():
            output.append('%{{A:focus_desktop_{}:}}'.format(desktop))
            output.append(self._formats[state][0])
            output.append('{P}{desktop}{P}'.format(P=PADDING, desktop=desktop))
            output.append(self._formats[state][1])
            output.append('%{A}')

        return ''.join(output)

    def handle_event(self, event):
        if not event.startswith('focus_desktop_'):
            return

        desktop = event[event.rindex('_') + 1:]
        sp.Popen(['bspc', 'desktop', '--focus', desktop])


class Windows(lemonbar_manager.Module):
    def __init__(self, monitor_name):
        """A BSPWM Window Switcher.

        Parameters:
            monitor_name (str): The monitor name to look for windows.
        """
        super().__init__()

        self._windows = {}

        # Get an initial mapping of which desktop each window is on
        (self._monitor_id, self._focused_desktop,
            self._desktop_windows) = get_monitor_info(monitor_name)

        self._focused_window = None

        self.readables = [
            sp.Popen(['xtmon'], stdout=sp.PIPE, bufsize=0).stdout,
            sp.Popen(
                ['bspc', 'subscribe', 'node'],
                stdout=sp.PIPE, bufsize=0).stdout
        ]

    def _process_event(self, event):
        """Parse and process the window events from all processes.

        Parameters:
            event (str): The event recieved from xtmon.
        """
        def split_convert(string, num_split, exclude=None):
            """Split a string and convert to hex.

            Parameters:
                string (str): The string to split.
                num_split (int): The number of times to split the string.
                exclude (list): A list of indexes to exclude from the convert.

            Returns:
                list: A list of converted parts.
            """
            exclude = [] if exclude is None else exclude
            parts = string.split(' ', num_split)

            for i in range(num_split + 1):
                # Ensure we have the required number of parts, even if they're
                # empty
                if i > len(parts) - 1:
                    parts.append('' if i in exclude else '0')

                if i not in exclude:
                    parts[i] = int(parts[i], 16)

            return parts

        event_name, event_details = event.split(' ', 1)

        # The only event we don't catch is navigation to an empty desktop, we'd
        # need to run `bspc subscribe desktop` to catch these events.

        if event_name in ('initial_title', 'title_changed', 'new_window'):
            window_id, title = split_convert(event_details, 1, [1])
            self._windows[window_id] = title
        elif event_name in ('initial_focus', 'focus_changed'):
            window_id, *_ = split_convert(event_details, 1, [1])
            self._focused_window = window_id
        elif event_name == 'removed_window':
            window_id = split_convert(event_details, 0)[0]
            del self._windows[window_id]
        elif event_name == 'node_focus':
            _, desktop_id, _ = split_convert(event_details, 2)

            if desktop_id in self._desktop_windows:
                self._focused_desktop = desktop_id
        elif event_name == 'node_transfer':
            (_, src_desktop_id, src_window_id, dst_monitor_id,
                dst_desktop_id, _) = split_convert(event_details, 5)

            if src_desktop_id in self._desktop_windows:
                self._desktop_windows[src_desktop_id].remove(src_window_id)

            if dst_desktop_id in self._desktop_windows:
                self._desktop_windows[dst_desktop_id].append(src_window_id)
        elif event_name == 'node_add':
            _, desktop_id, _, window_id = split_convert(event_details, 3)

            if desktop_id in self._desktop_windows:
                self._desktop_windows[desktop_id].append(window_id)
        elif event_name == 'node_remove':
            _, desktop_id, window_id = split_convert(event_details, 2)

            if desktop_id in self._desktop_windows:
                self._desktop_windows[desktop_id].remove(window_id)

    def output(self):
        for readable in self.select():
            event = readable.readline().decode('utf-8').strip()
            self._process_event(event)

        output = []
        for desktop_id, window_ids in self._desktop_windows.items():
            for window_id in window_ids:
                if window_id not in self._windows:
                    # This is usually just because we haven't parsed the
                    # initial output from xtmon yet, it'll update before you
                    # notice
                    continue

                title = self._windows[window_id]

                max_len = 20
                if len(title) > max_len:
                    title = '{}...'.format(title[0:max_len])

                if window_id == self._focused_window:
                    output.append(
                        '%{{B#333}}'
                        '{P}{title:<20s}{P}'
                        '%{{B-}}'.format(
                        P=PADDING, title=title))
                elif desktop_id != self._focused_desktop:
                    output.append(
                        '%{{A:focus_node_{wid}:}}'
                        '{P}%{{F#444}}{title:<20s}%{{F-}}{P}'
                        '%{{A}}'.format(
                            P=PADDING, wid=window_id, title=title)
                    )
                else:
                    output.append(
                        '%{{A:focus_node_{wid}:}}'
                        '{P}{title:<20s}{P}'
                        '%{{A}}'.format(
                            P=PADDING, wid=window_id, title=title)
                    )

        return ''.join(output)

    def handle_event(self, event):
        if not event.startswith('focus_node_'):
            return

        window_id = event[event.rindex('_') + 1:]
        sp.Popen(['bspc', 'node', '--focus', window_id])
