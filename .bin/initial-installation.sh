#!/bin/bash
# shellcheck disable=SC2024

# The script for installing my system

# Check variables
missing_files=""
missing_packages=""

# Declaration of message colors
info_color=36
success_color=32
error_color=31

check_file() {
  if [ ! -f "$1" ]; then
    missing_files="$missing_files\n $1,"
  fi
}

check_package() {
  if ! pacman -Qs "$1" >/dev/null; then
    missing_packages="$missing_packages\n $1,"
  fi
}

print_log_message() {
  printf "\e[%dmInstallation log: %b\e[0m\n" "$1" "$2"
}

printf "\e[36mPlease, make sure you move all files to your home directory.\e[0m\n"
printf "\e[36mAlso, the computer must have internet access and git must be installed.\e[0m\n"

while true; do
  read -rp "Do you want to continue? (y/n): " choice
  case "$choice" in
  [Yy])
    break
    ;;
  [Nn])
    echo "Aborting..."
    exit
    ;;
  *)
    echo "Invalid input. Please enter 'y' or 'n'."
    ;;
  esac
done

print_log_message $info_color "system installation initiated..."

# Prerequisites check
print_log_message $info_color "prerequisites check..."
# Files check
check_file "${HOME}/.system-config-backup/pacman/pacman.conf"
check_file "${HOME}/.system-config-backup/pkglist.txt"
check_file "${HOME}/.system-config-backup/pacman/create-backup.hook"
check_file "${HOME}/.system-config-backup/pacman/create-aur-backup.hook"
check_file "${HOME}/.system-config-backup/pacman/electron.hook"
check_file "${HOME}/.system-config-backup/systemd/logind.conf"
check_file "${HOME}/.system-config-backup/tlp.conf"
check_file "${HOME}/.system-config-backup/config.toml"
check_file "${HOME}/.system-config-backup/reflector.conf"
#Packages check
check_package "git"

if [ -n "$missing_files" ]; then
  print_log_message $error_color "missing files...\n $missing_files"
  print_log_message $error_color "installation aborted."
  exit 1
fi
if [ -n "$missing_packages" ]; then
  print_log_message $error_color "missing packages...\n $missing_packages"
  print_log_message $error_color "installation aborted."
  exit 1
fi

# Installing packages
print_log_message $info_color "official packages installation initiated..."
sudo cp "${HOME}/.system-config-backup/pacman/pacman.conf" "/etc/pacman.conf"
print_log_message $success_color "pacman configuration file replaced."
print_log_message $info_color "pacman repos sync..."
sudo pacman -Sy

cd "${HOME}" || exit
sudo pacman -S - <"${HOME}/.system-config-backup/pkglist.txt"
print_log_message $success_color "all packages from the official repositories have been installed."
sudo pacman -Scc
print_log_message $success_color "pacman cache has been cleared."

# Installing the AUR helper(paru)
print_log_message $info_color "paru installation initiated..."
cd "${HOME}" || exit
git clone https://aur.archlinux.org/paru.git
print_log_message $success_color "paru repo has been cloned."
cd paru || exit
makepkg -si
print_log_message $success_color "paru has been installed."
cd ..
rm -rf paru
print_log_message $success_color "paru repo has been deleted."

# Installing AUR packages
print_log_message $info_color "AUR packages installation initiated..."
paru -S - <"${HOME}/.system-config-backup/aurpkglist.txt"
print_log_message $success_color "all packages from AUR have been installed."
paru -Sccd
print_log_message $success_color "paru cache has been cleared."

# Installing and configuring oh-my-zsh
print_log_message $info_color "oh-my-zsh installation initiated..."
0>/dev/null sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv "${HOME}/.zshrc.pre-oh-my-zsh" "${HOME}/.zshrc"

# Downloading all git submodules such as waybar-crypto, etc
print_log_message $info_color "submodules update initiated..."
cd "${HOME}" || exit
git submodule update --init --recursive
print_log_message $success_color "all submodules has been updated."

# Copying all pacman hooks and some configuration files that are not stored in ${XDG_CONFIG_HOME}
# Hooks
print_log_message $info_color "pacman hooks copying initiated..."
sudo mkdir /etc/pacman.d/hooks/
sudo cp "${HOME}/.system-config-backup/pacman/"*.hook /etc/pacman.d/hooks/
print_log_message $success_color "pacman hooks has been copied."

# Config files
print_log_message $info_color "system configs copying initiated..."
sudo cp "${HOME}/.system-config-backup/systemd/logind.conf" "/etc/systemd/logind.conf"
sudo cp "${HOME}/.system-config-backup/tlp/tlp.conf" "/etc/tlp.conf"
sudo cp "${HOME}/.system-config-backup/greetd/config.toml" "/etc/greetd/config.toml"
sudo cp "${HOME}/.system-config-backup/reflector/reflector.conf" "/etc/xdg/reflector/reflector.conf"
print_log_message $success_color "system configs has been copied."

# Start some daemons
print_log_message $info_color "enable the necessary services..."
systemctl enable --now tlp.service
systemctl enable --now greetd.service
systemctl enable --now swayosd-libinput-backend.service
systemctl enable --now reflector.service
systemctl enable --now greetd.service

chsh -s /usr/bin/zsh celtic

curl -o .config/OpenRGB/plugins/effects.so https://openrgb.org/releases/plugins/effects/release_0.9/OpenRGBEffectsPlugin_0.9_Bullseye_64_f1411e1.so

print_log_message $success_color "system installation finished."
zsh
