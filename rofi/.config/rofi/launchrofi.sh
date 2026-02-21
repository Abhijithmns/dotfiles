#!/bin/sh

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

rofi -show drun \
    -theme "$HOME/.config/rofi/config.rasi" \
    -theme-str "* {
        background:     ${color0:-rgba(10,10,10,0)};
        background-alt: ${color0:-rgba(10,10,10,0)};
        foreground:     ${color7:-#EEEEEE};
        selected:       ${color7:-#EEEEEE};
        active:         ${color2:-#A6E3A1};
        urgent:         ${color1:-#F38BA8};
    }" \
    -theme-str "window { background-color: ${color0:-#0a0a0a}cc; }"
