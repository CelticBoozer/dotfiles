# Waybar

The default status bar for Sway - 'swaybar' although quite minimalistic and
lightweight, is very limited and low-functional. That's why I've chosen
[waybar](https://github.com/Alexays/Waybar/) as an alternative. Waybar is a
more advanced status bar that offers extensive customization options and
additional features.

I tried to style the waybar to look like the vim-airline plugin.

![waybar](waybar.png "Waybar")

Most of the modules I use are standard modules and you can read information
about them in the official waybar documentation. However, below you can see
a list of custom modules.

- [waybar-crypto](https://github.com/Chadsr/waybar-crypto/) - displays the price
  of cryptocurrencies directly on the bar.
- [wttrbar](https://github.com/bjesus/wttrbar/) - displays the current weather,
  it uses information from wttr.in.
- [pacman-updates](https://github.com/coffebar/waybar-module-pacman-updates/) -
  displays the number of packages for which an update has appeared.

## Behavior

Some plugins have an intended behavior when you click on them with the mouse.

- pacman-update:
  - Left-click to run the sysupg script, to upgrade system.
- clock:
  - Left-click to change the mode to date.
- pulseaudio:
  - Left-click to run the pulsemixer.
  - Right-click to run the easyeffects.
- network:
  - Left-click to run the nmtui.
- cpu:
  - Left-click to run the btop.
- memory:
  - Left-click to run the sysz.
- backlight:
  - Wheel to adjust/decrease the brightness of the monitor.
- notification:
  - Left-click to run the SwayNC panel.
  - Right-click to enter the do-not-disturb-mode.
