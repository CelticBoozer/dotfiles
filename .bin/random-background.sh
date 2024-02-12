#!/usr/bin/bash

# Script to set wallpaper and periodically(every 5 mins) change it
swaybg -i "$(find "${HOME}/.wallpaper/." -type f | shuf -n1)" -m fill &
OLD_PID=$!

while true; do
    sleep 300
    swaybg -i "$(find "${HOME}/.wallpaper/." -type f | shuf -n1)" -m fill &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
