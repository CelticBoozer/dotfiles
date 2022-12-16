#!/bin/sh

cp ../.system-config-backup/pacman/create-backup.hook /usr/share/libalpm/hooks/create-backup.hook
cp ../.system-config-backup/pacman/create-aur-backup.hook /usr/share/libalpm/hooks/create-aur-backup.hook
cp ../.system-config-backup/pacman/pacman.conf /etc/pacman.conf
cp ../.system-config-backup/systemd/logind.conf /etc/systemd/logind.conf
cp ../.system-config-backup/tlp.conf /etc/tlp.conf
