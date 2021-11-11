from collections import OrderedDict
import subprocess as sp

from lemonbar_manager import Module


PADDING = '   '  # Padding


class Tags(Module):
    def __init__(self, monitor):
        """A BSPWM desktop indicator.

        Parameters:
            monitor (str): The name of the monitor to show the desktop status
                for.
        """
        super().__init__()

        # Subscribe to BSPWM events and make the `Manager` class wait on it's
        # stdout before updating the module.
        self._subscription_process = sp.Popen(
            ['bspc', 'subscribe', 'report'], stdout=sp.PIPE, bufsize=0)
        self.readable = self._subscription_process.stdout

        self._monitor = monitor

        # The format strings use to display the stauts of the desktops
        self._formats = {
            'O': ('%{B#333}', '%{-u}%{B-}'),            # Focused, Occupied
            'F': ('%{B#333}%{F#000}', '%{F-}%{B-}'),  # Focused, Free
            'U': ('%{B#CF6A4C}', '%{B-}'),                # Focused, Urgent

            'o': ('', ''),                      # Unfocused, Occupied
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
        event = self.readable.readline().decode('utf-8').strip()
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


class Windows(Module):
    def __init__(self):
        """A BSPWM Window Switcher."""
        super().__init__()

        self._subscription_process = sp.Popen(
            ['xtmon'], stdout=sp.PIPE, bufsize=0)
        self.readable = self._subscription_process.stdout

        self._windows = {}
        self._focused = None

    def _process_event(self, event):
        """Parse and process the window title events.

        Parameters:
            event (str): The event recieved from xtmon.
        """
        try:
            event_name, window_id, title = event.split(' ', 2)
        except ValueError:
            event_name, window_id = event.split(' ', 1)
            title = ''

        if event_name in ('initial_title', 'title_changed', 'new_window'):
            self._windows[window_id] = title
        elif event_name in ('initial_focus', 'focus_changed'):
            self._focused = window_id
        elif event_name in ('removed_window',):
            del self._windows[window_id]

    def output(self):
        event = self.readable.readline()
        self._process_event(event.decode('utf-8').strip())

        output = []

        for window_id, title in self._windows.items():
            max_len = 20
            if len(title) > max_len:
                title = '{}...'.format(title[0:max_len])

            if window_id == self._focused:
                output.append('%{{B#333}}{P}{title:<20s}{P}%{{B-}}'.format(
                    P=PADDING, title=title))
            else:
                output.append(
                    '%{{A:focus_node_{wid}:}}{P}{title:<20s}{P}%{{A}}'.format(
                        P=PADDING, wid=window_id, title=title)
                )

        return ''.join(output)

    def handle_event(self, event):
        if not event.startswith('focus_node_'):
            return

        window_id = event[event.rindex('_') + 1:]
        sp.Popen(['bspc', 'node', '--focus', window_id])
