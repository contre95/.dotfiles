#!/usr/bin/zsh
pacmd set-default-sink $( ( s=$(pacmd list-sinks | grep index); echo "$s"; echo "$s") | grep '\*' -m 1 -A 1 | tail -1 | sed -e 's/    index: //')
