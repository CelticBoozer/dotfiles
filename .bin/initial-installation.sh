#!/bin/bash

# Script to install my system

# Message colors declaration
info_title="\e[36mInstallation log:\e[0m"
success_title="\e[32mInstallation log:\e[0m"
error_title="\e[31mInstallation log:\e[0m"

# Function to check file exist
check_file_exists() {
    if [ ! -f "$1" ]; then
        printf "%b file %s missing, installation aborted\n" "$error_title" "$1"
        exit
    fi
}

# Function to check if a Pacman package is installed
check_package_installed() {
    if ! pacman -Qs "$1" > /dev/null; then
        printf "%b %s is not installed, installation aborted\n" "$error_title" "$1"
        exit
    fi
}

printf "%b system installation initiated\n" "$info_title"

# Packages installation
printf "%b official packages installation initiated\n" "$info_title"
check_file_exists "${HOME}/.system-config-backup/pacman/pacman.conf"
sudo cp "${HOME}/.system-config-backup/pacman/pacman.conf" "/etc/pacman.conf"
printf "%b pacman configuration file replaced\n" "$success_title"
printf "%b pacman repos sync\n" "$info_title"
sudo pacman -Sy

cd "${HOME}" || exit
check_file_exists "${HOME}/.system-config-backup/pkglist.txt"
sudo pacman -S - < "${HOME}/.system-config-backup/pkglist.txt"
printf "%b all packages from the official repositories have been installed\n" "$success_title"
sudo pacman -Scc
printf "%b pacman cache has been cleared\n" "$success_title"

# AUR helper(paru) installation
printf "%b paru installation initiated\n" "$info_title"
cd "${HOME}" || exit
check_package_installed "git"
git clone https://aur.archlinux.org/paru.git
printf "%b paru repo has been cloned\n" "$success_title"
cd paru || exit
makepkg -si
printf "%b paru has been installed\n" "$success_title"
cd ..
rm -rf paru
printf "%b paru repo has been deleted\n" "$success_title"

# AUR packages installation
printf "%b AUR packages installation initiated\n" "$info_title"
paru -S - < "${HOME}/.system-config-backup/aurpkglist.txt"
printf "%b all packages from AUR have been installed\n" "$success_title"
paru -Sccd
printf "%b paru cache has been cleared\n" "$success_title"

# oh-my-zsh installation and configuration
printf "%b oh-my-zsh installation initiated\n" "$info_title"
0>/dev/null sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd "${HOME}/.oh-my-zsh/custom/plugins/" || exit
printf "%b oh-my-zsh custom plugins cloning initiated\n" "$info_title"
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zdharma/fast-syntax-highlighting.git
printf "%b default shell has been changed to the zsh\n" "$success_title"

# Download all git submodules such as waybar-crypto etc.
printf "%b submodules update initiated\n" "$info_title"
cd "${HOME}" || exit
git submodule update --recursive --remote
printf "%b all submodules has been updated\n" "$success_title"

# Copies all pacman hooks and some configs that are not stored not in ${XDG_CONFIG_HOME}

# Hooks
printf "%b pacman hooks copying initiated\n" "$info_title"
check_file_exists "${HOME}/.system-config-backup/pacman/create-backup.hook"
sudo cp "${HOME}/.system-config-backup/pacman/create-backup.hook" "/usr/share/libalpm/hooks/create-backup.hook"
check_file_exists "${HOME}/.system-config-backup/pacman/create-aur-backup.hook"
sudo cp "${HOME}/.system-config-backup/pacman/create-aur-backup.hook" "/usr/share/libalpm/hooks/create-aur-backup.hook"
check_file_exists "${HOME}/.system-config-backup/pacman/electron.hook"
sudo cp "${HOME}/.system-config-backup/pacman/electron.hook" "/usr/share/libalpm/hooks/electron.hook"
printf "%b pacman hooks has been copied\n" "$success_title"

# Configs
printf "%b system configs copying initiated\n" "$info_title"
check_file_exists "${HOME}/.system-config-backup/systemd/logind.conf"
sudo cp "${HOME}/.system-config-backup/systemd/logind.conf" "/etc/systemd/logind.conf"
check_file_exists "${HOME}/.system-config-backup/tlp.conf"
sudo cp "${HOME}/.system-config-backup/tlp.conf" "/etc/tlp.conf"
check_file_exists "${HOME}/.system-config-backup/config.toml"
sudo cp "${HOME}/.system-config-backup/config.toml" "/etc/greetd/config.toml"
printf "%b system configs has been copied\n" "$success_title"

#Start some daemons
systemctl enable --now tlp.service
systemctl enable --now greetd.service
systemctl enable --now swayosd-libinput-backend.service

# Electron links setup
printf "%b electron symlinks check initiated\n" "$info_title"
sh "${HOME}/.bin/update-electron-symlinks.sh"

printf "%b system installation finished\n" "$success_title"
