#!/usr/bin/env bash

if wpctl status | grep "MUTED" | grep "*" >/dev/null 2>&1; then
  echo '<span color="#FF6363"> </span>' "$(wpctl get-volume @DEFAULT_SOURCE@ | awk -F" " '{ print $2 * 100 "%"}')"
else
  echo '<span color="#6D6D6D"> </span>' "$(wpctl get-volume @DEFAULT_SOURCE@ | awk -F" " '{ print $2 * 100 "%"}')"
fi

