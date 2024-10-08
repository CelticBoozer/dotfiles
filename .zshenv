# zsh settings
export ZSH_COMPDUMP="${HOME}/.cache/zcompdump-${ZSH_VERSION}"
export ZSH_CUSTOM="${HOME}/.zsh_custom"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374,bg=bold,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *|ls *|l *|cat *|man *|rm *|mv *|chmod *|cp *|rmdir *)"

# XDG settings
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"

# Wayland settings
export MOZ_ENABLE_WAYLAND=1 firefox
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=gtk3
export WEBKIT_DISABLE_COMPOSITING_MODE=1

# Other settings
export ARCHFLAGS="-arch x86_64"
export BROWSER="firefox-developer-edition"
export DIFFPROG="nvim -d"
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"
