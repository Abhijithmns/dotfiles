#!/bin/sh

bluetoothctl monitor | while read -r line; do
    case "$line" in
        *"Powered: yes"*)
            dunstify -t 2000 -r 7001 "Bluetooth" "Bluetooth ON" &
            ;;
        *"Powered: no"*)
            dunstify -t 2000 -r 7001 "Bluetooth" "Bluetooth OFF" &
            ;;
        *"Connected: yes"*)
            dunstify -t 2000 -r 7002 "Bluetooth" "Device connected" &
            ;;
        *"Connected: no"*)
            dunstify -t 2000 -r 7002 "Bluetooth" "Device disconnected" &
            ;;
    esac
done


