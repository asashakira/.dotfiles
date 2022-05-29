#!/bin/sh

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

autoload -U colors && colors
PS1="%B%F{red}%n%F{blue}%~ %F{reset_color}%b$ "
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

alias v='nvim'
alias g='g++ -std=gnu++17 -Wall -o a'
alias gs='g sol.cc'
alias a='./a'
alias p='python'
alias ps='python sol.py'

case ${OSTYPE} in 
  darwin*)
    alias ls='ls -G'
    ;;
  linux*)
    alias ls='ls --color=auto'
    ;;
esac

alias la='ls -A'
alias vimrc='v ~/.config/nvim/'
alias zshrc='v ~/.zshrc'
alias szshrc='source ~/.zshrc'
alias yabairc='v ~/.config/yabai/yabairc'
alias skhdrc='v ~/.config/skhd/skhdrc'
alias i3='v ~/.config/i3/config'
alias i3s='v ~/.config/i3status/config'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt histignorealldups histignoredups histignorespace histreduceblanks
setopt print_eight_bit
setopt auto_cd
setopt no_beep
setopt nolistbeep
setopt auto_pushd

# init envs
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(nodenv init -)"

