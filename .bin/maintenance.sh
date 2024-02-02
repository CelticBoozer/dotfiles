#!/bin/bash

# Rate mirrors
sudo reflector --save /etc/pacman.d/mirrorlist

# Clean home dir
rm -rf ~/.android
rm -rf ~/.cargo
rmdir ~/Desktop
rm -rf ~/Downloads/Telegram\ Desktop
rm -rf ~/.yarn
rm ~/.pulse-cookie
rm ~/.python_history
rm ~/.yarnrc
rm ~/.bash_history

# Clean rofi modes cache
cliphist wipe
rm ~/.local/share/rofi/rofi_calc_history
