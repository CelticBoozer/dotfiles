export ZSH="$HOME/.oh-my-zsh/"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="strug"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fast-syntax-highlighting
        zsh-autosuggestions
        sudo
        copypath
        copyfile
        dirhistory
        archlinux
        vi-mode
        timer)

source $ZSH/oh-my-zsh.sh

# Set aliases
alias maint="sh $HOME/.bin/maintenance.sh"
alias sysupg="sh $HOME/.bin/upgrade-system.sh"
alias ls="eza --long --header --icons=always"
alias l="eza --long --header --git --icons=always --all"
alias cp="cpg -g"
alias mv="mvg -g"
alias cat="bat"
alias find="fd -I -c always"

export PATH=$PATH:/home/celtic/.millennium/ext/bin
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
