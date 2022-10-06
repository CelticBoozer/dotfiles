# Linux dotfiles
Greetings, thanks for stopping by here. I tried to make a lightweight system based on Arch Linux,
[SwayWM](https://github.com/swaywm/sway) and Unix way(mostly) approach. As the main theme of the system and all
programs, I chose the [gruvbox](https://github.com/morhetz/gruvbox) because of the pleasant palette for me and the
absence of acidic colors, because I have to work for hours every day.

![Entire screen](.doc-screens/entire-screen.png)
***
## Distro
I chose Arch Linux as a distribution because of its powerful pacman package manager, full customizability to my needs,
strong community and rolling release model, thanks to which I receive continuous system updates.
## Kernel
I chose the [linux-zen](https://github.com/zen-kernel/zen-kernel) kernel, because it has a large number of patches that
imperceptibly improve the system.
## Pacman
The basic configuration file of the pacman almost does not need customization, but I added a parameter

    Parallel Downloads = 5

to the /etc/pacman.conf (options block), to support parallel package downloads.

List of pacman repositories:
- core;
- extra;
- community;
- multilib.
## AUR helper
Most Arch Linux users use so-called AUR helpers to simplify the installation of packages from AUR. I chose
[paru](https://github.com/Morganamilo/paru) because it is a very powerful AUR helper, its syntax is similar to the
syntax of the pacman itself, it is not abandoned and it is easy to customize.
## Shell
I replaced the base shell (bash) with zsh. Zsh contains a huge number of user interaction improvements such as themes,
plugins, etc.

For the convenience of configuring the zsh, I use the framework [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh). Just
follow the [installation guide](https://github.com/ohmyzsh/ohmyzsh/blob/master/README.md).

List of plugins:
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting);
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions);
- sudo;
- copypath;
- copyfile;
- dirhistory;
- archlinux;
- vi-mode;
- timer.

To install the first two plugins, clone them to ~/.oh-my-zsh/custom/plugins/. As the theme I chose strug.
## Terminal emulator
I chose [kitty](https://github.com/kovidgoyal/kitty) as the terminal emulator. This is one of the best terminal
emulators in my opinion, besides it supports images preview and ligatures.

![kitty + oh-my-zsh](.doc-screens/kitty-zsh.png)
## Sway
Sway configured with all needed daemons and hotkey configs.

List of daemons/background tasks:
- [swayidle](https://github.com/swaywm/swayidle);
- [mako](https://github.com/emersion/mako);
- [wlsunset](https://github.com/kennylevinsen/wlsunset);
- [swaykbdd](https://github.com/artemsen/swaykbdd);
- [easyeffects](https://github.com/wwmm/easyeffects);
- [kanshi](https://github.com/emersion/kanshi);
- ~/.bin/randomBackground.sh.

[xcursor-simp1e-gruvbox-dark](https://gitlab.com/zoli111/simp1e/) is used as the cursor theme, and 
[papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) is used for icons, and
[gruvbox-dark-gtk](https://github.com/jmattheis/gruvbox-dark-gtk) is used as gtk apps theme.

![Sway](.doc-screens/sway.png)
## Waybar
[Waybar](https://github.com/Alexays/Waybar) is the best Wayland native bar. Configured in gruvbox theme and airline
style. Some of the plugins - is clickable.

List of plugins:
- sway/workspaces;
- [custom/crypto](https://github.com/chadsr/waybar-crypto);
- sway/mode;
- pulseaudio: left-click - Volume Control, right-click - EasyEffects;
- network: left-click - [nmtui](https://github.com/heftig/NetworkManager);
- cpu: left-click - [btop](https://github.com/aristocratos/btop);
- memory;
- temperature;
- backlight;
- battery;
- sway/language;
- tray;

To install the crypto plugin - clone the repo to ~/.config/waybar/modules/.

![Waybar](.doc-screens/waybar.png)
## Mako
Mako is a well-known notification daemon. Very useful with any messanger/browser etc...

![Mako](.doc-screens/mako.png)
## Wob
[Wob](https://github.com/francma/wob) - is overlay bar, to visualize volume/brightness changes.

![Wob](.doc-screens/wob.png)