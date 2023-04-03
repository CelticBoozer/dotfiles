export ARCHFLAGS="-arch x86_64"
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1 firefox
export RANGER_LOAD_DEFAULT_RC=false ranger
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374,bg=bold,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *|ls *|l *|cat *|man *|rm *|mv *|chmod *|cp *|rmdir *)"
export ZSH_COMPDUMP="${HOME}/.cache/zcompdump-${ZSH_VERSION}"
export XDG_CONFIG_HOME="$HOME/.config"
export browser="firefox-developer-edition"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export BROWSER="firefox-developer-edition"
export QT_QPA_PLATFORMTHEME=gtk3
export TTV_USERNAME=celticboozer359
alias maint="sh $HOME/.bin/maintenance.sh"
alias sysupg="sh $HOME/.bin/upgrade-system.sh"

