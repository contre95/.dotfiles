import subprocess as sp

import lemonbar_manager


class Command(lemonbar_manager.Module):
    def __init__(self, command, label=""):
        """A constant value.

        Parameters:
            command (list): The command to execute (with Popen)
        """
        super().__init__()
        self._command = command
        self._label = label

    def output(self):
        try:
            return self._label + ' %{F#FFFFF0}' + str(sp.check_output(self._command).decode("utf-8").strip()) + '%{F-}'
        except Exception:
            return self._label + ' %{F#FFFFF0}' + "Not Connected" + '%{F-}'


class Const(lemonbar_manager.Module):
    def __init__(self, value):
        """A constant value.

        Parameters:
            value (str): The value to output to the bar.
        """
        super().__init__()
        self._value = value

    def output(self):
        return self._value


class Wrap(lemonbar_manager.Module):
    def __init__(self, module, wrap_with):
        """Wrap another modules output.

        Parameters:
            module (Module): The module to wrap.
            wrap with (str): A string containing one set of `{}` that will be
                replaced with the output of the `module`.
        """
        super().__init__()
        self._module = module
        self._update()
        self._wrap_with = wrap_with

    def _update(self):
        """Copy the wrapped modules properties to this module.

        This ensures it's properly integrated with the framework.
        """
        self.readable = self._module.readable
        self.wait_time = self._module.wait_time
        self.last_update = self._module.last_update
        self.cache = self._module.cache

    def output(self):
        output = self._module.output()
        self._update()
        return self._wrap_with.format(output)

    def handle_event(self, event):
        self._module.handle_event(event)
        self._update()


class Launcher(lemonbar_manager.Module):
    def __init__(self, label, command):
        """A simple clickable element to launch a program.

        Parameters:
            label (str): The string to write to the bar.
            command (list): The command to execute (with Popen)
        """
        super().__init__()

        self._label = label
        self._command = command
        self._event_name = '{}_click'.format(self._label)

    def output(self):
        return '%{A:' + self._event_name + ':}' + self._label + '%{A}'

    def handle_event(self, event):
        """Handle out click event.

        Parameters:
            event (str): The event name.
        """
        if event != self._event_name:  # Ignore the event if it's not ours
            return

        sp.Popen(self._command)
