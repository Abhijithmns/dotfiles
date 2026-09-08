#!/bin/sh

# tell apps we are on X11 
export XDG_SESSION_TYPE=x11
setxkbmap -option caps:escape_shifted_capslock &

# X resources
xrdb -merge ~/.Xresources

export XCURSOR_SIZE=32

# restore pywal colors (needed for dunst, etc.)
. "$HOME/.cache/wal/colors.sh"

# notifications
pkill dunst
~/.config/dunst/launchdunst.sh &

# compositor (start after a tiny delay)
sleep 0.3
picom &

# restore wallpaper + colors (MUST be backgrounded)
wal -R &
polybar &

## Network manager and blueman icons
nm-applet &
blueman-applet &
# window manager
while type dwm >/dev/null; do
    dwm && continue || break
done

