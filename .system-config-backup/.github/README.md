# System config backups

This directory contains backups of system and configuration files that are not
in the home directory. It also contains lists of installed packages.

- **greetd** - contains the configuration of the greetd login manager.
- **pacman** - contains the configuration file and all the necessary pacman hooks.
  - *91-create-backup.hook* - records a list of all manually installed packages,
    without AUR packages and dependencies. File - .system-config-backup/pkglist.txt.
  - *92-create-backup.hook* - records a list of all manually installed AUR packages.
    File - .system-config-backup/aurpkglist.txt.
  - *93-electron.hook* - create missing and remove unnecessary symlinks for each
    version of electron.
  - *94-check-pacnew.hook* - searches for .pacnew files and reports if any are
    present.
  - *95-backup-configs.hook* - copies the configuration files in .system-config-backup.
  - *96-build-nnn.hook* - clones and builds nnn with a flag to support icons.
- **reflector** - contains the configuration of the reflector.
- **systemd** - contains the configuration of the logind.
- **tlp** - contains the configuration of the tlp laptop battery utility.
