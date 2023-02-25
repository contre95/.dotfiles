import lemonbar_manager
import modules
import bspwm_modules
import clock_modules
import os
import disk_modules


PADDING = '  '  # Padding

ONE_TO_FIVE = {"1","2","3","4","5"}
SIX_TO_NINE = {"6","7","8","9"}
APPS = {"","ﭮ","","",""}
IP_CMD = ["/usr/bin/curl","--connect-timeout","3","ifconfig.io"]
WIFI_CMD = ["iwgetid","-r"]
#import logging
#logging.basicConfig(level=logging.INFO, filename='/tmp/lemonbar.log')
if os.environ.get("MYENV") == 'server':
    a = '250'
    g = 'x45'
    o = '-1'
    f =  'JetBrainsMono Nerd Font:size=12'
    modules = (
        modules.Const('%{Sf}%{l}'),
        modules.Const(' '),
        bspwm_modules.Tags('DP3', include=ONE_TO_FIVE),
        modules.Const('%{c}'),
        modules.Const(f'{os.environ.get("MYENV")}'),
        modules.Const(' | '),
        modules.Command(command=IP_CMD, label="", errMsg="0.0.0.0"),
        modules.Const('%{r}'),
        clock_modules.Clock(),
        )
elif os.environ.get("MYENV") == 'desktop':
    a = '100'
    g = 'x20'
    o = '-3'
    f =  'JetBrainsMono Nerd Font:size=12'
    modules = (
            modules.Const('%{Sf}%{l}'),
            modules.Const(' '),
            bspwm_modules.Tags('HDMI-0', include=ONE_TO_FIVE),
            modules.Const('%{c}'),
            modules.Const(f'{os.environ.get("MYENV")}'),
            modules.Const(' | '),
            modules.Command(command=WIFI_CMD, label="", errMsg="Not Connected"),
            modules.Const(' | '),
            modules.Command(command=IP_CMD, label="", errMsg="0.0.0.0"),
            modules.Const('%{r}'),
            modules.Command(command=["/home/canus/Scripts/oneliners-scr/connected-blth.sh"], label=""),
            modules.Const(' | '),
            modules.Command(command=["/home/canus/Scripts/oneliners-scr/default-audio.sh"], label="%{F#FFEA00}%{F-}"),
            modules.Const('%{Sl}%{l}'),
            modules.Const(PADDING),
            bspwm_modules.Tags('DP-4', include=SIX_TO_NINE),
            modules.Const('%{c}'),
            bspwm_modules.Tags('DP-4', include=APPS),
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
elif os.environ.get("MYENV") == 'notebook':
    a = '150'
    g = 'x25'
    o = '-0'
    f =  'JetBrainsMono Nerd Font:size=12'
    modules = (
          modules.Const('%{Sf}%{l}'),
          bspwm_modules.Tags('eDP-1', include=ONE_TO_FIVE),
          modules.Const('%{c}'),
          modules.Command(command=WIFI_CMD, label="", errMsg="Not Connected"),
          modules.Const(' | '),
          clock_modules.Clock(),
          modules.Const(' | '),
          modules.Const(f'{os.environ.get("MYENV")}'),
          modules.Const(' | '),
          modules.Command(command=["/usr/bin/cat","/sys/class/power_supply/BAT0/capacity"], label="%", errMsg="0.0.0.0"),
          modules.Const(' | '),
          modules.Command(command=["/usr/bin/curl","--connect-timeout","3","ifconfig.io"], label="", errMsg="0.0.0.0"),
          modules.Const('%{r}'),
          bspwm_modules.Tags('eDP-1', include=APPS),
          modules.Const(PADDING),
       )


# Lemonbar command
command = (
    'lemonbar',
    '-b',
    '-a', a,
    '-g', g,
    '-B', '#111111',
    '-F', '#5E81AC',
    '-o', o,  # Push Noto down 0px
    '-f', f
)

# Run the bar with the given modules
with lemonbar_manager.Manager(command, modules) as mgr:
    mgr.loop()



















