#!/bin/bash
# Creative Live! Cam Sync V3 - Optimized Configuration
# Based on actual available controls

DEVICE="/dev/video0"

echo "Configuring Creative Live! Cam Sync V3..."

# Set resolution to 1080p @ 30fps
v4l2-ctl -d $DEVICE --set-fmt-video=width=1920,height=1080,pixelformat=MJPG
v4l2-ctl -d $DEVICE --set-parm=30

# Basic Image Controls
# brightness: -64 to 64 (default: 3)
# Setting to 10-15 for slightly brighter image in typical indoor lighting
v4l2-ctl -d $DEVICE --set-ctrl=brightness=12

# contrast: 0 to 64 (default: 38)
# Setting to 42 for slightly more punch
v4l2-ctl -d $DEVICE --set-ctrl=contrast=42

# saturation: 0 to 128 (default: 64)
# Setting to 75 for more vivid colors without oversaturation
v4l2-ctl -d $DEVICE --set-ctrl=saturation=75

# hue: -40 to 40 (default: 0)
# Keep at 0 for accurate colors
v4l2-ctl -d $DEVICE --set-ctrl=hue=0

# gamma: 72 to 500 (default: 100)
# Keep at 100 for natural look
v4l2-ctl -d $DEVICE --set-ctrl=gamma=100

# gain: 0 to 100 (default: 0)
# Set to 10 for low-light improvement without too much noise
# Use 0 if you have good lighting, increase to 15-20 for dim rooms
v4l2-ctl -d $DEVICE --set-ctrl=gain=10

# sharpness: 0 to 6 (default: 3)
# Setting to 4 for slightly crisper image
v4l2-ctl -d $DEVICE --set-ctrl=sharpness=4

# backlight_compensation: 0 to 8 (default: 4)
# Increase if you have bright window behind you
# Decrease if you have good front lighting
v4l2-ctl -d $DEVICE --set-ctrl=backlight_compensation=4

# White Balance Configuration
# First, disable auto white balance to set manual temperature
v4l2-ctl -d $DEVICE --set-ctrl=white_balance_automatic=0

# white_balance_temperature: 2800 to 6500 (default: 4600)
# 2800-3200: Warm tungsten/incandescent lights
# 3500-4000: Mixed indoor lighting (RECOMMENDED for most)
# 4600-5000: Neutral indoor
# 5500-6500: Daylight/cool white LED
v4l2-ctl -d $DEVICE --set-ctrl=white_balance_temperature=3800

# Exposure Configuration
# auto_exposure: 0=Manual, 1=Auto, 3=Aperture Priority (default: 3)
# Setting to Manual (1) for consistent exposure
v4l2-ctl -d $DEVICE --set-ctrl=auto_exposure=1

# exposure_time_absolute: 1 to 5000 (default: 157)
# Lower = brighter but may blur with movement
# Higher = darker but sharper with movement
# 157 is default (good starting point)
# Adjust based on your lighting:
#   - Good lighting: 100-150
#   - Normal lighting: 150-250 (RECOMMENDED)
#   - Dim lighting: 250-400
v4l2-ctl -d $DEVICE --set-ctrl=exposure_time_absolute=200

# exposure_dynamic_framerate: Keep disabled for consistent 30fps
v4l2-ctl -d $DEVICE --set-ctrl=exposure_dynamic_framerate=0

# power_line_frequency: 0=Disabled, 1=50Hz, 2=60Hz
# Set based on your region:
#   - Europe/most of world: 50 Hz (1)
#   - Americas/some Asia: 60 Hz (2)
# This prevents flickering from artificial lights
v4l2-ctl -d $DEVICE --set-ctrl=power_line_frequency=1

echo "Camera configuration complete!"
echo ""
echo "Current settings:"
v4l2-ctl -d $DEVICE --all | grep -A 1 "brightness\|contrast\|saturation\|sharpness\|exposure\|white_balance"
