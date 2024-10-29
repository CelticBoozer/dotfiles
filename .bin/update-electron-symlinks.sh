#!/bin/bash

# Script to create new/delete old symlinks to electron wayland flags file, for each version of electron

# Create a symlink if one does not exist for the corresponding package
for package in $(pacman -Qq | grep '^electron[0-9]*$'); do
  if [ ! -L "/home/celtic/.config/$package-flags.conf" ]; then
    ln -s "/home/celtic/.config/electron-flags.conf" "/home/celtic/.config/$package-flags.conf"
    echo -e "\e[32mCreated symlink for $package...\e[0m"
  else
    echo -e "\e[36mSymlink for $package exists...\e[0m"
  fi
done

# Remove the link if the corresponding package is missing
for file in "/home/celtic/.config"/electron[0-9]*-flags.conf; do
  # Extracting a package name from a file name
  package=$(basename "$file" "-flags.conf")

  # Check if the package exists
  if ! pacman -Q "$package" >/dev/null; then
    echo -e "\e[31mPackage $package not found, deleting $file...\e[0m"
    rm "$file"
  fi
done
