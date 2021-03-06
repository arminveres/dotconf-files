# History
HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST # first delete duplicate commands if HISTFILE exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicate commands
setopt HIST_IGNORE_SPACE      # ignore commands starting with space
setopt HIST_VERIFY            # show command with history expansion to user before running it

export PATH=$HOME/bin:$HOME/.bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:/usr/local/bin:$PATH
export VISUAL=nvim
export EDITOR=nvim

# setting some XDGs
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export WINEPREFIX="$XDG_DATA_HOME"/wine
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export JDTLS_HOME="/home/arminveres/.local/share/nvim/lsp_servers/jdtls/"
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc
export MANGOHUD_CONFIGFILE=$HOME/.config/MangoHud/MangoHud.conf

eval "$(zoxide init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
