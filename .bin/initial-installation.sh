#!/bin/sh

# Script to install all programs, submodules etc.

# Message colors declaration
info_color=36
success_color=32
error_color=31

print_colored_title() {
    echo -e "\e[${1}mInstallation log:\e[0m"
}

# Function to check file exist
check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "$(print_colored_title $error_color) file $1 missing, installation aborted"
        exit
    fi
}

# Function to check if a Pacman package is installed
check_package_installed() {
    if ! pacman -Qs "$1" > /dev/null; then
        echo "$(print_colored_title $error_color) $1 is not installed, installation aborted"
        exit
    fi
}

echo "$(print_colored_title $info_color) system installation initiated"

read -p "Enter"

# Packages installation
echo "$(print_colored_title $info_color) official packages installation initiated"
check_file_exists "${HOME}/.system-config-backup/pacman/pacman.conf"
sudo cp "${HOME}/.system-config-backup/pacman/pacman.conf" "/etc/pacman.conf"
echo "$(print_colored_title $success_color) pacman configuration file replaced"
echo "$(print_colored_title $info_color) pacman repos sync"
sudo pacman -Sy

cd "${HOME}" || exit
check_file_exists "${HOME}/.system-config-backup/pkglist.txt"
sudo pacman -S - < "${HOME}/.system-config-backup/pkglist.txt"
echo "$(print_colored_title $success_color) all packages from the official repositories have been installed"
sudo pacman -Scc
echo "$(print_colored_title $success_color) pacman cache has been cleared"

read -p "Enter"

# AUR helper(paru) installation
echo "$(print_colored_title $info_color) paru installation initiated"
cd "${HOME}" || exit
check_package_installed "git"
git clone https://aur.archlinux.org/paru.git
echo "$(print_colored_title $success_color) paru repo has been cloned"
cd paru || exit
makepkg -si
echo "$(print_colored_title $success_color) paru has been installed"
cd ..
rm -rf paru
echo "$(print_colored_title $success_color) paru repo has been deleted"

read -p "Enter"
# AUR packages installation
echo "$(print_colored_title $info_color) AUR packages installation initiated"
paru -S - < "${HOME}/.system-config-backup/aurpkglist.txt"
echo "$(print_colored_title $success_color) all packages from AUR have been installed"
paru -Sccd
echo "$(print_colored_title $success_color) paru cache has been cleared"

read -p "Enter"
# oh-my-zsh installation and configuration
echo "$(print_colored_title $info_color) oh-my-zsh installation initiated"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd "${HOME}/.oh-my-zsh/custom/plugins/" || exit
echo "$(print_colored_title $info_color) oh-my-zsh custom plugins cloning initiated"
read -p "Enter"
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zdharma/fast-syntax-highlighting.git
chsh --shell /bin/zsh
echo "$(print_colored_title $success_color) default shell has been changed to the zsh"

read -p "Enter"
# Download all git submodules such as waybar-crypto etc.
echo "$(print_colored_title $info_color) all submodules cloning initiated"
git submodule update --init
echo "$(print_colored_title $success_color) all submodules has been cloned"

read -p "Enter"
# Copies all pacman hooks and some configs that are not stored not in ${XDG_CONFIG_HOME}

# Hooks
echo "$(print_colored_title $info_color) pacman hooks copying initiated"
check_file_exists "${HOME}/.system-config-backup/pacman/create-backup.hook"
sudo cp "${HOME}/.system-config-backup/pacman/create-backup.hook" "/usr/share/libalpm/hooks/create-backup.hook"
check_file_exists "${HOME}/.system-config-backup/pacman/create-aur-backup.hook"
sudo cp "${HOME}/.system-config-backup/pacman/create-aur-backup.hook" "/usr/share/libalpm/hooks/create-aur-backup.hook"
check_file_exists "${HOME}/.system-config-backup/pacman/electron.hook"
sudo cp "${HOME}/.system-config-backup/pacman/electron.hook" "/usr/share/libalpm/hooks/electron.hook"
echo "$(print_colored_title $success_color) pacman hooks has been copied"

read -p "Enter"
# Configs
echo "$(print_colored_title $info_color) system configs copying initiated"
check_file_exists "${HOME}/.system-config-backup/systemd/logind.conf"
sudo cp "${HOME}/.system-config-backup/systemd/logind.conf" "/etc/systemd/logind.conf"
check_file_exists "${HOME}/.system-config-backup/tlp.conf"
sudo cp "${HOME}/.system-config-backup/tlp.conf" "/etc/tlp.conf"
check_file_exists "${HOME}/.system-config-backup/config.toml"
sudo cp "${HOME}/.system-config-backup/config.toml" "/etc/greetd/config.toml"
echo "$(print_colored_title $success_color) system configs has been copied"

read -p "Enter"
#Start some daemons
systemctl enable --now tlp.service
systemctl enable --now swayosd-libinput-backend.service

read -p "Enter"
# Electron links setup
echo "$(print_colored_title $info_color) electron symlinks check initiated"
sh "${HOME}/.bin/update-electron-symlinks.sh"

echo "$(print_colored_title $success_color) system installation finished"
