import subprocess as sp

import lemonbar_manager


class DiskUsage(lemonbar_manager.Module):
    def __init__(self, disk, update_interval=60,icon=""):
        """Get the disk usage for a block device.

        Parameters:
            disk (str): The block device to get the usage of (i.e. /dev/sda1)
            update_interval (int): How often to update the module.
        """
        super().__init__()
        self.wait_time = update_interval

        self._icon= icon
        self._disk = disk

    def output(self):
        process = sp.run(
            ['df', f'--output=avail,pcent', self._disk],
            capture_output=True, encoding='UTF-8')

        _, values = process.stdout.strip().split('\n')
        available, used = [int(v.strip('%')) for v in values.split(' ') if v]

        template = self._icon + '%{{F#FFFFF0}}' + ' {}G' + ' %{{F-}}'

        if used > 90:
            template = (
                '%{{F#CF6A4C}} '
                + template +
                ' %{{F-}}'
            )



        return template.format(round(available / 1024 / 1024, 1))

