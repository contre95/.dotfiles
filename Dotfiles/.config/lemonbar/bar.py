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
    modules.Const('%{c}'),
    bspwm_modules.Tags('DP-4'),
    modules.Const('%{r}'),
    modules.Const(PADDING),

    modules.Const('%{Sl}%{l}'),
    modules.Const(PADDING),
    modules.Command(command=["/usr/bin/curl","ifconfig.io"], label=""),
    modules.Const('%{c}'),
    bspwm_modules.Tags('DP-0'),
    modules.Const('%{r}'),
    modules.Const(PADDING),
    disk_modules.DiskUsage('/dev/sda1',icon=""),
    modules.Const(PADDING),
    disk_modules.DiskUsage('/dev/nvme0n1p2',icon=""),
    modules.Const(PADDING),
    disk_modules.DiskUsage('/dev/nvme0n1p3', icon=""),
    modules.Const(PADDING),
    clock_modules.Clock(),
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
