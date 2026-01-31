#!/bin/sh

choice=$(printf "Shutdown\nReboot\nLogout\nLock\n" | rofi -dmenu \
  -p Power \
  -theme ~/.config/rofi/power-menu.rasi)

case "$choice" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Logout) pkill dwm ;;
  Lock) betterlockscreen -l blur --dim 60 ;;
esac

