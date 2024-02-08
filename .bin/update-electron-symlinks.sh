#!/bin/sh

# Script to create new/delete old symlinks on electron wayland flags file, for each electron version

# Create a symlink if it does not exist for the corresponding package
for package in $(pacman -Qq | grep '^electron[0-9]*$'); do
    if [ ! -L "/home/celtic/.config/$package-flags.conf" ]; then
        ln -s "/home/celtic/.config/electron-flags.conf" "/home/celtic/.config/$package-flags.conf"
        echo "Created symlink for $package"
    else
        echo "Symlink for $package exists"
    fi
done

# Remove the link if the corresponding package is missing
for file in "/home/celtic/.config"/electron[0-9]*-flags.conf; do
    # Extract the package name from the file name
    package=$(basename "$file" "-flags.conf")

    # Check if the package exists
    if ! pacman -Q "$package" > /dev/null; then
        echo "Package $package not found, deleting $file..."
        rm "$file"
    fi
done
