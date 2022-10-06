# My Linux dotfiles
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
emulators in my opinion, besides it supports rendering images in the terminal and ligatures.
 
![kitty + oh-my-zsh](.doc-screens/kitty-zsh.png)
