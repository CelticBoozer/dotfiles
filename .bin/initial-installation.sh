#!/bin/sh

# Script to install all programs, submodules etc.

# Packages installation

sudo cp "${HOME}/.system-config-backup/pacman/pacman.conf" "/etc/pacman.conf"
cd "${HOME}" || exit
sudo pacman -S - < "${HOME}/.system-config-backup/pkglist.txt"

# AUR helper(paru) installation
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si
cd ..
rm -rf paru

# AUR packages installation
paru -S - < "${HOME}/.system-config-backup/aurpkglist.txt"

# Zsh and oh-my-zsh installation and configuration
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd "${HOME}/.oh-my-zsh/custom/plugins/" || exit
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zdharma/fast-syntax-highlighting.git
chsh --shell /bin/zsh

# Download all git submodules such as waybar-crypto etc.
git submodule update --init

sh "${HOME}/"

# Copies all pacman hooks and some configs that are not stored not in ${XDG_CONFIG_HOME}

# Hooks
sudo cp "${HOME}/.system-config-backup/pacman/create-backup.hook" "/usr/share/libalpm/hooks/create-backup.hook"
sudo cp "${HOME}/.system-config-backup/pacman/create-aur-backup.hook" "/usr/share/libalpm/hooks/create-aur-backup.hook"
sudo cp "${HOME}/.system-config-backup/pacman/electron.hook" "/usr/share/libalpm/hooks/electron.hook"

# Configs
sudo cp "${HOME}/.system-config-backup/systemd/logind.conf" "/etc/systemd/logind.conf"
sudo cp "${HOME}/.system-config-backup/tlp.conf" "/etc/tlp.conf"
sudo cp "${HOME}/.system-config-backup/config.toml" "/etc/greetd/config.toml"

#Start some daemons
systemctl enable --now tlp.service
systemctl enable --now swayosd-libinput-backend.service

# Electron links setup
sh "${HOME}/.bin/update-electron-symlinks.sh"
