#!/bin/sh

BAT="BAT0"
CAPACITY="/sys/class/power_supply/$BAT/capacity"
STATUS="/sys/class/power_supply/$BAT/status"

LOW=10
CRIT=5

[ -f "$CAPACITY" ] || exit 0

PERCENT=$(cat "$CAPACITY")
STATE=$(cat "$STATUS")

# Only notify when discharging
[ "$STATE" = "Discharging" ] || exit 0

if [ "$PERCENT" -le "$CRIT" ]; then
  dunstify -u critical -r 9991 \
    "Battery critical" "Battery at ${PERCENT}%\nPlug in NOW!"
elif [ "$PERCENT" -le "$LOW" ]; then
  dunstify -u normal -r 9991 \
    "Battery low" "Battery at ${PERCENT}%"
fi


