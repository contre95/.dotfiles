#!env bash


if wpctl status | grep "MUTED" | grep "*" >/dev/null 2>&1; then
  echo '<span color="#FF6363"> </span>' "$(pactl get-source-volume 0 | awk -F/ '{ print $2}' | tr -d ' ')"
else
  echo '<span color="#6D6D6D"> </span>' "$(pactl get-source-volume 0 | awk -F/ '{ print $2}' | tr -d ' ')"
fi
# Or with wireplumber
# wpctl set-mute $(wpctl status | grep -i 'C01U Pro condenser microphone Analog Stereo' | awk -F' ' '{print $3}' | tr -d '.') toggle

