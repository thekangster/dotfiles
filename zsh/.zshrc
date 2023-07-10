alias "vim"="nvim"


export PATH="/opt/homebrew/sbin:$PATH"


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
#ZSH_THEME="gentoo"
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
#export PROMPT='%B[kevkyu@amadeus %c]$%b '
#export PROMPT='%B[kevkyu@amadeus %(5~|%-1~/.../%3~|%4~)]$%b '
#export PROMPT='%B%F{cyan}kevkyu@amadeus%f %F{blue}%(5~|%-1~/.../%3~|%4~)%b%f$ '
#export RPROMPT='%B%(?..%?)%b' # Set right prompt to print most recent exit code if non-zero

#PROMPT='λ kevkyu@%m %B%(5~|%-1~/.../%3~|%4~)%b $(git_prompt_info)%{$reset_color%}'

#RPROMPT='%B%(?..%?)%b'
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# git theming

#ZSH_THEME_GIT_PROMPT_PREFIX="%B(%b$fg_no_bold[green]%}%B"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%b%B)%b%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"

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


# not used
get_smart_path() {
  local pwd=$(pwd)
  pwd=${pwd/#$HOME/\~}
  sed 's:\([^/]\)[^/]*/:\1/:g' <<<"$pwd"
}

# fix my prompt
_fishy_collapsed_wd() {
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo "${(j:/:)pwd}"
}

local user_color='blue'; [ $UID -eq 0 ] && user_color='red'
PROMPT='%Bkevkyu@%m %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%} %(!.#.$)%b '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT="${RPROMPT}"'${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}*"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

