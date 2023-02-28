import lemonbar_manager
import modules
import bspwm_modules
import clock_modules
import os
import disk_modules

PADDING = '  '  # Padding

SIX_TO_NINE = {"6","7","8","9"}
ONE_TO_FIVE = {"1","2","3","4","5"}
APPS = {"","ﭮ","","",""}
ENVIRON = modules.Const(f'{os.environ.get("MYENV")}')
WIFI = modules.Command(command=["iwgetid","-r"], label="", errMsg="Not Connected")
BLUETOOTH = modules.Command(command=[f"{os.environ.get('SCR_PATH')}/oneliners-scr/connected-blth.sh"], label="")
DEFAULT_AUDIO = modules.Command(command=[f"{os.environ.get('SCR_PATH')}/oneliners-scr/default-audio.sh"], label="%{F#FFEA00}%{F-}")
IP = modules.Command(command=["/usr/bin/curl","--connect-timeout","3","ifconfig.io"], label="", errMsg="0.0.0.0")
BATTERY = modules.Command(command=["/usr/bin/cat","/sys/class/power_supply/BAT0/capacity"], label="%", errMsg="0.0.0.0")
# BTC = modules.Command(command=["/usr/bin/curl","--connect-timeout","3","usd.rate.sx/1BTC"], label="%{F#FFCF00} %{F-}", errMsg="0.0.0.0")
BTC = modules.Command(command="curl -X GET 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd' | jq '.[].usd'",shell=True,text=True, label="%{F#FFCF00} %{F-}", errMsg="0.0.0.0")
DOT = modules.Command(command="curl -X GET 'https://api.coingecko.com/api/v3/simple/price?ids=polkadot&vs_currencies=usd' | jq '.[] .usd'", shell=True,text=True,label="%{F#FF00C7} D%{F-}", errMsg="0.0.0.0")
#import logging
#logging.basicConfig(level=logging.INFO, filename='/tmp/lemonbar.log')
if os.environ.get("MYENV") == 'server':
    a = '250'
    g = 'x25'
    o = '0'
    f =  'JetBrainsMono Nerd Font:size=12'
    modules = (
        modules.Const('%{Sf}%{l}'),
        modules.Const(' '),
        bspwm_modules.Tags('DP3', include=ONE_TO_FIVE),
        modules.Const('%{c}'),
        ENVIRON,
        modules.Const(' | '),
        IP,
        modules.Const('%{r}'),
        BTC,
        DOT,
        modules.Const(' | '),
        clock_modules.Clock(),
        )
elif os.environ.get("MYENV") == 'desktop':
    a = '100'
    g = 'x25'
    o = '1'
    f =  'JetBrainsMono Nerd Font:size=12'
    modules = (
            modules.Const('%{Sf}%{l}'),
            modules.Const(' '),
            bspwm_modules.Tags('HDMI-0', include=ONE_TO_FIVE),
            modules.Const('%{c}'),
            ENVIRON,
            modules.Const(' | '),
            WIFI,
            modules.Const(' | '),
            IP,
            modules.Const('%{r}'),
            modules.Const(PADDING),
            disk_modules.DiskUsage('/dev/sda1',icon=""),
            modules.Const(PADDING),
            disk_modules.DiskUsage('/dev/nvme0n1p2',icon=""),
            modules.Const(PADDING),
            disk_modules.DiskUsage('/dev/nvme0n1p3', icon=""),
            modules.Const(' | '),
            BLUETOOTH,
            modules.Const(' | '),
            DEFAULT_AUDIO,
            modules.Const('%{Sl}%{l}'),
            modules.Const(PADDING),
            bspwm_modules.Tags('DP-4', include=SIX_TO_NINE),
            modules.Const('%{c}'),
            bspwm_modules.Tags('DP-4', include=APPS),
            modules.Const('%{r}'),
            modules.Const(PADDING),
            DOT,
            BTC,
            modules.Const(' | '),
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
          WIFI,
          modules.Const(' | '),
          clock_modules.Clock(),
          modules.Const(' | '),
          ENVIRON,
          modules.Const(' | '),
          BATTERY,
          modules.Const(' | '),
          IP,
          modules.Const('%{r}'),
          BTC,
          DOT,
          modules.Const(' | '),
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



















