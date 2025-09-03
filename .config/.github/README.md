# .config directory

This directory contains configuration files for my system. Every configuration
contains a README.md file with a description of the configuration. Here I'll
describe the configuration files, without own directory.

- electron-flags.conf - contains the flags for electron apps, to run on Wayland,
  instead of X11. Automated hook - [93-electron.hook](../../.system-config-backup/pacman/93-electron.hook)
  creates missing and remove unnecessary symlinks for each version of electron.
- mimeapps.list - contains the list of applications that can be used to open
  files with a specific MIME type.
- pulsemixer.cfg - contains the configuration of the pulsemixer. Great TUI tool
  for controlling the volume of your soundcard.
- user-dirs.dirs - contains the list of directories that are used.
- user-dirs.locale - contains the list of locales that are used.
