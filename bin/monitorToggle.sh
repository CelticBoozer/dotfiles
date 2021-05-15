#!/bin/sh

if [[ -z "$connected" ]]; then
	echo 'Monitor disconnected'
	xrandr --output HDMI-1-1 --off
else
	displayed=$(xrandr | grep 'HDMI-1-1 connected 1920x1080+1920+0')
	
	if [[ -z "$displayed" ]]; then
		echo 'Not displayed,enable it'
		xrandr --output HDMI-1-1 --mode 1920x1080 --pos 1920x0
	else
		echo 'Displayed, disable it'
		xrandr --output HDMI-1-1 --off
	fi
fi
