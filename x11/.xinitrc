#!/bin/sh

# tell apps we are on X11 
export XDG_SESSION_TYPE=x11
setxkbmap -option caps:escape_shifted_capslock &

# X resources
xrdb -merge ~/.Xresources

# restore pywal colors (needed for dunst, etc.)
. "$HOME/.cache/wal/colors.sh"

# notifications
pkill dunst
~/.config/dunst/launchdunst.sh &

# compositor (start after a tiny delay)
sleep 0.3
picom &
polybar &

# restore wallpaper + colors (MUST be backgrounded)
wal -R &

# window manager
while type dwm >/dev/null; do
    dwm && continue || break
done

