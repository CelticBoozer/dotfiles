#!/bin/zsh

# Upgrade system and packages
sudo pacman -Syu
paru -Syu

# Clean up packages and package cache
sudo pacman -Rs $(pacman -Qtdq)
sudo pacman -Scc
paru -Sccd
