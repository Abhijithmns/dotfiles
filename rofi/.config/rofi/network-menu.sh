#!/bin/sh

choice=$(nmcli -t -f IN-USE,SSID,SECURITY,SIGNAL dev wifi list | \
  sed 's/^*/* /' | \
  awk -F: '{printf "%-2s %-30s %-10s %s%%\n", $1, $2, $3, $4}' | \
  rofi -dmenu \
    -p "Wi-Fi" \
    -theme ~/.config/rofi/power-menu.rasi)

[ -z "$choice" ] && exit

ssid=$(echo "$choice" | awk '{print $2}')

# Check if network is secured
if nmcli -f SECURITY dev wifi list | grep -q "$ssid.*WPA"; then
  pass=$(rofi -dmenu -password -p "Password for $ssid" \
    -theme ~/.config/rofi/power-menu.rasi)
  [ -z "$pass" ] && exit
  nmcli dev wifi connect "$ssid" password "$pass"
else
  nmcli dev wifi connect "$ssid"
fi

