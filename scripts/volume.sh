#!/bin/sh

STEP=5

get_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1 | tr -d '%'
}

is_muted() {
  pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes
}

notify() {
  vol=$(get_volume)

  if is_muted; then
    dunstify -a "volume" -r 2594 -t 2000 \
      -i "$HOME/Pictures/sysicon/volume-mute.png" \
      "Muted"
  else
    dunstify -a "volume" -r 2594 -t 2000 \
      -h int:value:"$vol" \
      -i "$HOME/Pictures/sysicon/volume.png" \
      "Volume: $vol%"
  fi
}

case "$1" in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +${STEP}%
    notify
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -${STEP}%
    notify
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    notify
    ;;
esac


