#!/bin/bash
# shellcheck disable=SC2046

# Script to update all packages, clear orphans and pacman cache
# INFO: zsh alias: sysupg

# Upgrading system and packages
printf "\e[36mUpdating official packages:\e[0m\n"
sudo pacman -Syu
printf "\e[36mUpdating AUR packages:\e[0m\n"
paru -Syu

# Clearing packages and cache
printf "\e[36mClear orphan packages:\e[0m\n"
sudo pacman -Rs $(pacman -Qtdq)
printf "\e[36mClear pacman and paru cache:\e[0m\n"
sudo pacman -Scc
paru -Sccd

# Updating github repos
printf "\e[36mUpdating submodules:\e[0m\n"
git submodule update --recursive --remote
