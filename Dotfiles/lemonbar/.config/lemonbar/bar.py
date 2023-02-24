import lemonbar_manager
import modules
import bspwm_modules
import clock_modules
import os
import disk_modules
import socket


PADDING = '  '  # Padding


#import logging
#logging.basicConfig(level=logging.INFO, filename='/tmp/lemonbar.log')
if os.environ.get("MYENV") == 'server':
        modules = (
            modules.Const('%{Sf}%{l}'),
            modules.Const(' '),
            bspwm_modules.Tags('DP3', include={"1","2","3","4","5"}),
            modules.Const('%{c}'),
            modules.Const(f'{os.environ.get("MYENV")}'),
            modules.Const(' | '),
            modules.Command(command=["/usr/bin/curl","--connect-timeout","3","ifconfig.io"], label="", errMsg="0.0.0.0"),
            modules.Const('%{r}'),
            clock_modules.Clock(),
            modules.Const(PADDING),
            )
elif os.environ.get("MYENV") == 'desktop':
    modules = (
            modules.Const('%{Sf}%{l}'),
            modules.Const(' '),
            bspwm_modules.Tags('HDMI-0', include={"1","2","3","4","5"}),
            modules.Const('%{c}'),
            modules.Const(f'{os.environ.get("MYENV")}'),
            modules.Const(' | '),
            modules.Command(command=["iwgetid","-r"], label="", errMsg="Not Connected"),
            modules.Const(' | '),
            modules.Command(command=["/usr/bin/curl","--connect-timeout","3","ifconfig.io"], label="", errMsg="0.0.0.0"),
            modules.Const('%{r}'),
            modules.Command(command=["/home/canus/Scripts/oneliners-scr/connected-blth.sh"], label=""),
            modules.Const(' | '),
            modules.Command(command=["/home/canus/Scripts/oneliners-scr/default-audio.sh"], label="%{F#FFEA00}%{F-}"),

            modules.Const('%{Sl}%{l}'),
            modules.Const(PADDING),
            bspwm_modules.Tags('DP-4', include={"6","7","8","9"}),
            modules.Const('%{c}'),
            bspwm_modules.Tags('DP-4', include={"","ﭮ","","",""}),
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
