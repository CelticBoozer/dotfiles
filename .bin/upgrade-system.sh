#!/bin/bash
# shellcheck disable=SC2046

# Script to update all packages, clear orphans and pacman cache
# INFO: zsh alias: sysupg

# Upgrade system and packages
printf "\e[36mUpdate official packages:\e[0m\n"
sudo pacman -Syu
printf "\e[36mUpdate AUR packages:\e[0m\n"
paru -Syu

# Clear packages and cache
printf "\e[36mClear orphan packages:\e[0m\n"
mapfile -t orphans < <(pacman -Qtdq 2>/dev/null)
if [[ ${#orphans[@]} -gt 0 ]]; then
  sudo pacman -Rs "${orphans[@]}"
else
  printf "\e[36mNo orphan packages found.\e[0m\n"
fi
printf "\e[36mClear pacman and paru cache:\e[0m\n"
sudo pacman -Scc
paru -Sccd

# Update github repos
printf "\e[36mUpdate submodules:\e[0m\n"
git submodule update --recursive --remote
