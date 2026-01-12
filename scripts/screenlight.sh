#!/bin/sh

get_brightness() {
  brightnessctl -m | cut -d, -f4 | tr -d '%'
}

notify_up() {
  dunstify -a "brightness" \
    -i "$HOME/Pictures/sysicon/brightness-up.svg" \
    -r 2593 -t 2000 \
    -h int:value:"$(get_brightness)" \
    "Brightness"
}

notify_down() {
  dunstify -a "brightness" \
    -i "$HOME/Pictures/sysicon/brightness-down.svg" \
    -r 2593 -t 2000 \
    -h int:value:"$(get_brightness)" \
    "Brightness"
}

case "$1" in
  up)
    brightnessctl set +2%
    notify_up
    ;;
  down)
    brightnessctl set 2%-
    notify_down
    ;;
esac




