#!/usr/bin/bash

# Script to upgrade all packages, cleanup orphans and cache
# zsh alias: sysupg

# Upgrade system and packages
sudo pacman -Syu
paru -Syu

# Clean up packages and package cache
sudo pacman -Rs "$(pacman -Qtdq)"
sudo pacman -Scc
paru -Sccd

# Update github repos, installed as packages
git submodule update --recursive --remote
cd "${HOME}/.oh-my-zsh/custom/plugins/fast-syntax-highlighting" || exit
git pull
cd "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" || exit
git pull
