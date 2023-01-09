#!/bin/sh

sudo cp ~/.system-config-backup/pacman/create-backup.hook /usr/share/libalpm/hooks/create-backup.hook
sudo cp ~/.system-config-backup/pacman/create-aur-backup.hook /usr/share/libalpm/hooks/create-aur-backup.hook
sudo cp ~/.system-config-backup/pacman/pacman.conf /etc/pacman.conf
sudo cp ~/.system-config-backup/systemd/logind.conf /etc/systemd/logind.conf
sudo cp ~/.system-config-backup/tlp.conf /etc/tlp.conf
sudo cp ~/.system-config-backup/config.toml /etc/greetd/config.toml

