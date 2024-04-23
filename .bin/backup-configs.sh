#!/bin/bash

# Copy the configuration files from the system directories to the backup directory
sudo cp "/etc/pacman.conf" "/home/celtic/.system-config-backup/pacman/pacman.conf"
sudo cp "/etc/systemd/logind.conf" "/home/celtic/.system-config-backup/systemd/logind.conf"
sudo cp "/etc/tlp.conf" "/home/celtic/.system-config-backup/tlp/tlp.conf"
sudo cp "/etc/greetd/config.toml" "/home/celtic/.system-config-backup/greetd/config.toml"
sudo cp "/etc/xdg/reflector/reflector.conf" "/home/celtic/.system-config-backup/reflector/reflector.conf"
