#!/bin/sh

cd ~/.bin
sudo pacman -S $(cat ~/.system-config-backup/pkglist.txt)
paru -S $(cat ~/.system-config-backup/aurpkglist.txt)

