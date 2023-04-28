alias "vim"="nvim"

export PATH=/usr/local/bin:$PATH
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
# Homebrew setup
if [[ $(uname -m) == 'arm64' ]]; then
    BREWPATH=/opt/homebrew/bin
else
    BREWPATH=/usr/local/bin
fi
export PATH=$BREWPATH:$PATH

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/Users/kevinkang/Library/Python/3.8/bin"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
plugin=(
  pyenv
)
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# doom emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# prompt stuff
#export PROMPT='[%{$fg[white]%}kevkyu%{$reset_color%}@%{$fg[white]%}%m%{$reset_color%} %{$fg_bold[white]%}%c%{$reset_color%}%{$reset_color%}]$ '
export PROMPT='[kevkyu@amadeus %B%c%b]$ '
export RPROMPT='%B%(?..%?)%b' # Set right prompt to print most recent exit code if non-zero

# enable vim mode on commmand line
bindkey -v
KEYTIMEOUT=1

# show vim status
_reset_cursor_color() printf '\e]112\a'
zle-keymap-select() {
    if [[ $KEYMAP = vicmd ]]; then
        printf '\e]12;#BEBEBE\a'
    else
        _reset_cursor_color
    fi
}
zle -N zle-keymap-select
zle-line-init() zle -K viins
zle -N zle-line-init
precmd_functions+=(_reset_cursor_color)


# Load version control information // not using anymore
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '*%b'
RPROMPT='' #\$vcs_info_msg_0_
