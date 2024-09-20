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
sudo pacman -Rs $(pacman -Qtdq)
printf "\e[36mClear pacman and paru cache:\e[0m\n"
sudo pacman -Scc
paru -Sccd

# Update github repos
printf "\e[36mUpdate submodules:\e[0m\n"
git submodule update --recursive --remote

# Update nnn plugins
printf "\e[36mUpdate nnn plugins:\e[0m\n"
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
