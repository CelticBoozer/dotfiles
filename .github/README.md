# Dotfiles

Greetings. Thanks for stopping by. This repository is the repository of my Linux
desktop system configuration. I tried to make my system lightweight, fast, easy
to reconfigure, functional and convenient for both daily use and work. Where it
is possible to use TUI without loss of functionality, I tried to use it. I also
tried to configure all programs in the same color palette.

![samples](assets/final.png "Gallery")

## Core system info

- OS: [Arch Linux](https://archlinux.org/)
- WM: [Sway](https://github.com/swaywm/sway)
- Shell: [zsh](https://github.com/zsh-users/zsh)
- Terminal Emulator: [kitty](https://github.com/kovidgoyal/kitty)
- Panel: [waybar](https://github.com/Alexays/Waybar)
- Text Editor: [neovim](https://github.com/neovim/neovim)
- App Launcher: [rofi](https://github.com/lbonn/rofi)
- File Manager: [nnn](https://github.com/jarun/nnn)
- Browser: [Firefox developer edition](https://www.mozilla.org/en-US/firefox/developer/)
- Notification Manager: [swaync](https://github.com/ErikReider/SwayNotificationCenter)
- Colorscheme: [Gruvbox-material](https://github.com/sainnhe/gruvbox-material)

## Whole System Info
<!-- markdownlint-disable MD013 -->
All the info about my setup.

> Some of this apps have the config files included in the repo, which are
  marked with :gear:.

### Main system software

| Entry                          | App                                                                                                            |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------- |
| **OS**                         | [Arch Linux](https://archlinux.org/)                                                                           |
| **AUR Helper**                 | [paru](https://github.com/Morganamilo/paru) [:gear:](../.config/paru/)                                         |
| **Display Manager**            | [greetd](https://sr.ht/~kennylevinsen/greetd/) (with [tuigreet](https://github.com/apognu/tuigreet))           |
| **Window Manager**             | [SwayWM](https://github.com/swaywm/sway) [:gear:](../.config/sway/)                                            |
| **Notification Daemon**        | [swaync](https://github.com/ErikReider/SwayNotificationCenter) [:gear:](../.config/swaync/)                    |
| **Popup**                      | [swayosd](https://github.com/ErikReider/SwayOSD)                                                               |
| **Bar**                        | [waybar](https://github.com/Alexays/Waybar) [:gear:](../.config/waybar/)                                       |
| **Audio Daemon**               | [pipewire](https://github.com/PipeWire/pipewire)                                                               |
| **Application Launcher**       | [rofi](https://github.com/lbonn/rofi) [:gear:](../.config/rofi/)                                               |
| **Clipboard Manager**          | [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (with [cliphist](https://github.com/sentriz/cliphist)) |
| **Lock Screen**                | [swaylock](https://github.com/jirutka/swaylock-effects) [:gear:](../.config/swaylock/)                         |
| **Idle Timeout**               | [swayidle](https://github.com/hyprwm/hypridle) [:gear:](../.config/swayidle/)                                  |
| **Screenshot Tool**            | [swappy](https://github.com/jtheoof/swappy) (with [grim](https://sr.ht/~emersion/grim/))                       |

### Shell and CLI/TUI software

| Entry                       | App                                                                                            |
| --------------------------- | ---------------------------------------------------------------------------------------------- |
| **Shell**                   | [zsh](https://github.com/zsh-users/zsh) [:gear:](../.zshrc)                                    |
| **Shell configuration**     | [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)                                                  |
| **Terminal Emulator**       | [kitty](https://sw.kovidgoyal.net/kitty/) [:gear:](../.config/kitty/)                          |
| **Text Editor**             | [neovim](https://neovim.io/) [:gear:](../.config/nvim/)                                        |
| **LS Replacement**          | [eza](https://github.com/eza-community/eza)                                                    |
| **Cat Replacement**         | [bat](https://github.com/sharkdp/bat) [:gear:](../.config/bat/)                                |
| **Find Replacement**        | [fd](https://github.com/sharkdp/fd) [:gear:](../.config/fd/)                                   |
| **File Manager**            | [nnn](https://github.com/jarun/nnn)                                                            |
| **Fuzzy File Finder**       | [fzf](https://github.com/junegunn/fzf)                                                         |
| **Fuzzy Word Finder**       | [ripgrep](https://github.com/BurntSushi/ripgrep) [:gear:](../.config/rg/)                      |
| **Git TUI**                 | [lazygit](https://github.com/jesseduffield/lazygit)                                            |
| **Docker TUI**              | [lazydocker](https://github.com/jesseduffield/lazydocker)                                      |
| **Trash CLI**               | [glib2](https://archlinux.org/packages/core/x86_64/glib2/) (gio trash)                         |
| **System Monitor**          | [btop](https://github.com/aristocratos/btop) [:gear:](../.config/btop/)                        |
| **Pulse audio control**     | [pulsemixer](https://github.com/GeorgeFilipkin/pulsemixer) [:gear:](../.config/pulsemixer.cfg) |

### GUI software

| Entry                    | App                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------ |
| **Web Browser**          | [Firefox developer edition](https://www.mozilla.org/en-US/firefox/developer/)        |
| **Messaging App**        | [Vesktop](https://github.com/Vencord/Vesktop) (Discord Client)                       |
| **PDF Viewer**           | [Zathura](https://github.com/pwmt/zathura) [:gear:](../.config/zathura/)             |
| **Note Taking App**      | [Obsidian](https://obsidian.md/)                                                     |
| **Video Player**         | [MPV](https://github.com/mpv-player/mpv) [:gear:](../.config/mpv/)                   |
| **Image Viewer**         | [imv](https://github.com/eXeC64/imv) [:gear:](../.config/imv/)                       |
| **Audio Effects**        | [Easyeffects](https://github.com/wwmm/easyeffects) [:gear:](../.config/easyeffects/) |
| **Image Editor**         | [Krita](https://krita.org/)                                                          |
| **Office Apps**          | [LibreOffice](https://www.libreoffice.org/)                                          |
| **Password manager**     | [KeePassXC](https://github.com/keepassxreboot/keepassxc)                             |

### Appearance

| Entry                           | App                                                                                                          |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Colorscheme**                 | [Gruvbox-material](https://github.com/sainnhe/gruvbox-material) (material soft)                              |
| **Fonts**                       | [JetBrainsMono](https://www.jetbrains.com/es-es/lp/mono/) and [Hack](https://github.com/source-foundry/Hack) |
| **Icon theme**                  | [Gruvbox-Material-Dark](https://github.com/TheGreatMcPain/gruvbox-material-gtk)                              |
| **Cursor theme**                | [Gruvbox Dark](https://gitlab.com/cursors/simp1e)                                                            |
| **Wallpappers**                 | [Aenami's](https://www.artstation.com/aenamiart) art works [:gear:](../.wallpaper/)                          |
