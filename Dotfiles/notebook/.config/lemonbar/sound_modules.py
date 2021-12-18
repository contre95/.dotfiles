import re
import subprocess as sp

import lemonbar_manager


class Volume(lemonbar_manager.Module):
    def __init__(self, device):
        """A simple ALSA volume control.

        Parameters:
            device (str): The name of the ALSA device to control.
        """
        super().__init__()
        self._device = device

        self._regex = re.compile(r'(\d{1,3})%')  # For parsing ALSA output
        self._increments = 40  # The resolution of our volume control

        self._current_level = self._get_level()

    def _parse_amixer(self, data):
        """Parse the output from the amixer command.

        Parameters::
            data (str): The output from amixer.

        Returns:
            int: An integer between 0 and 100 (inclusive) representing the
                volume level.
        """
        levels = [int(level) for level in re.findall(self._regex, data)]
        return sum(levels) / (len(levels) * 100)

    def _get_level(self):
        """Get the current volume level for the device.

        Returns:
            int: An integer between 0 and 100 (inclusive) representing the
                volume level.
        """
        process = sp.run(
            ['amixer', 'get', self._device],
            capture_output=True, encoding='UTF-8')

        return self._parse_amixer(process.stdout)

    def _set_level(self, percent):
        """Set the volume level for the device.

        Parameters:
            percent (int): An integer between 0 and 100 (inclusive).
        """
        sp.run(
            ['amixer', 'set', 'Master', '{:.0f}%'.format(percent)],
            capture_output=True, encoding='UTF-8')

    def output(self):
        output = ['\uF57F']
        for i in range(self._increments + 1):
            output.append('%{{A:set_volume_{}_{}:}}'.format(self._device, i))

            if round(self._increments*self._current_level) >= i:
                output.append('-')
            else:
                output.append('%{F#222}-%{F-}')

            output.append('%{A}')

        output.append(' \uF57E')

        return ''.join(output)

    def handle_event(self, event):
        if not event.startswith('set_volume_{}_'.format(self._device)):
            return

        level = int(event[event.rindex('_')+1:])
        percent = level / self._increments

        self._set_level(percent * 100)
        self._current_level = percent
        self.last_update = 0  # Invalidate the cache to force a redraw
