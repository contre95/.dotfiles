import lemonbar_manager
import modules
import bspwm_modules
import clock_modules
import disk_modules


PADDING = '  '  # Padding


#import logging
#logging.basicConfig(level=logging.INFO, filename='/tmp/lemonbar.log')


# Define the modules to put on the bar (in order)
modules = (
    modules.Const('%{Sf}%{l}'),
    bspwm_modules.Tags('eDP-1', include={"1","2","3","4","5","6","7","8","9"}),
    modules.Const('%{c}'),
    modules.Command(command=["iwgetid","-r"], label="", errMsg="Not Connected"),
    modules.Const(' | '),
    clock_modules.Clock(),
    modules.Const(' | '),
    modules.Command(command=["/usr/bin/cat","/sys/class/power_supply/BAT0/capacity"], label="%", errMsg="0.0.0.0"),
    modules.Const(' | '),
    modules.Command(command=["/usr/bin/curl","--connect-timeout","3","ifconfig.io"], label="", errMsg="0.0.0.0"),
    modules.Const('%{r}'),
    bspwm_modules.Tags('eDP-1', include={"","ﭮ","","",""}),
    modules.Const(PADDING),
    # disk_modules.DiskUsage('/dev/sda1',icon=""),
    # modules.Const(PADDING),
    # disk_modules.DiskUsage('/dev/nvme0n1p2',icon=""),
    # modules.Const(PADDING),
    # disk_modules.DiskUsage('/dev/nvme0n1p3', icon=""),
    modules.Const(PADDING),
)


# Lemonbar command
command = (
    'lemonbar',
    '-b',
    '-a', '100',
    '-g', 'x20',
    '-B', '#111111',
    '-F', '#5E81AC',
    '-o', '-3',  # Push Noto down 0px
    '-o', '-1', # Push Material Desisn Icons down -1px
    '-f', 'JetBrainsMono Nerd Font:size=11',
    '-f', 'Material Design Icons:size=13'
)

# Run the bar with the given modules
with lemonbar_manager.Manager(command, modules) as mgr:
    mgr.loop()
