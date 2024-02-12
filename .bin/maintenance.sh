#!/usr/bin/bash

# A script to clean and update some things on the system
# zsh alias: maint

# Rate mirrors
sudo reflector --save /etc/pacman.d/mirrorlist

# Clean ${HOME} from unneeded files and directories
rm -rf "${HOME}/.android"
rm -rf "${HOME}/.cargo"
rmdir "${HOME}/Desktop"
rm -rf "${HOME}/Downloads/Telegram\ Desktop"
rm -rf "${HOME}/.yarn"
rm "${HOME}/.pulse-cookie"
rm "${HOME}/.python_history"
rm "${HOME}/.yarnrc"
rm "${HOME}/.bash_history"

# Clean rofi modes cache
cliphist wipe
rm "${HOME}/.local/share/rofi/rofi_calc_history"
