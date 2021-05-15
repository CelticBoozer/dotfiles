#!/bin/sh

while true; do
	find ~/.wallpaper -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
		shuf -n1 -z | xargs -0 feh --bg-max
	sleep 15m
done
