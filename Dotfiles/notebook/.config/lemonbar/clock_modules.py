from time import time, strftime

import lemonbar_manager


class Clock(lemonbar_manager.Module):
    def __init__(self):
        """A simple clock.

        The clock can be clicked and will switch to the date for a period of
        time.
        """
        super().__init__()
        self.wait_time = 60  # How often to update this module
        self._toggled_at = 0  # When the clock was toggled

    def output(self):
        # If the clock has been toggled for more than a certain period of time
        if self._toggled_at and time() - self._toggled_at > 5:
            self._toggled_at = None  # Automatically toggle back to the clock

        if self._toggled_at:
            return '%{A:toggle_clock:} ' + '%{F#FFFFF0}' + strftime('%A %d/%m/%Y') + '%{A}' + ' %{F-}' 
        else:
            return '%{A:toggle_clock:} ' + '%{F#FFFFF0}' + strftime('%H:%M') + '%{A}' + ' %{F-}'

    def handle_event(self, event):
        if event != 'toggle_clock':
            return

        self._toggled_at = None if self._toggled_at else time()
        self.last_update = 0  # Invalidate the cache
