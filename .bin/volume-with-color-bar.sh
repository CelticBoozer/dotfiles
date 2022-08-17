echo pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}'
