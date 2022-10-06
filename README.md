# My Linux dotfiles
Greetings, thanks for stopping by here. I tried to make a lightweight system based on Arch Linux,
[SwayWM](https://github.com/swaywm/sway) and Unix way(mostly) approach. As the main theme of the system and all
programs, I chose the [gruvbox](https://github.com/morhetz/gruvbox) because of the pleasant palette for me and the
absence of acidic colors, because I have to work for hours every day.
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
I replaced the base shell (bash) with zsh. sh contains a huge number of user interaction improvements such as themes, 
plugins, etc.

For the convenience of configuring the zsh, I use the framework [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh).

List of