#!/bin/bash

# Copy the configuration files from the system directories to the backup directory
sudo cp "/etc/pacman.conf" "${HOME}/.system-config-backup/pacman/pacman.conf"
sudo cp "/etc/systemd/logind.conf" "${HOME}/.system-config-backup/systemd/logind.conf"
sudo cp "/etc/tlp.conf" "${HOME}/.system-config-backup/tlp/tlp.conf"
sudo cp "/etc/greetd/config.toml" "${HOME}/.system-config-backup/greetd/config.toml"
sudo cp "/etc/xdg/reflector/reflector.conf" "${HOME}/.system-config-backup/reflector/reflector.conf"
