#!/bin/zsh

sudo pacman -S $(cat ../.system-config-backup/pkglist.txt)
paru -S $(cat ../.system-config-backup/aurpkglist.txt)
