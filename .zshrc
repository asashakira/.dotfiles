#!/bin/sh

autoload -U compinit && compinit -u
autoload -U colors && colors
PS1="%B%{$fg[red]%}%n%{$fg[blue]%}%~ %{$reset_color%}$%b "
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

alias v='nvim'
alias g='g++ -std=gnu++17 -Wall -o a'
alias gs='g sol.cpp'
alias a='./a'
alias p='python'
alias ps='python sol.py'

if [ "$OSTYPE" = "linux-gnu" ]; then
  alias ls='ls --color=auto'
elif [ "$OSTYPE" = "darwin" ]; then
  alias ls='ls -G'
fi

alias la='ls -A'
alias vimrc='v ~/.config/nvim/init.vim'
alias zshrc='v ~/.zshrc'
alias szshrc='source ~/.zshrc'
alias i3='v ~/.config/i3/config'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#alias sus='sudo chmod 666 /sys/power/state && i3lock --color "#2f343f" && echo mem > /sys/power/state'
alias sus='sudo i3lock --color "#2f343f" && echo mem > /sys/power/state'
alias hib='sudo echo disk > /sys/power/state'

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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# i3blocks
export SCRIPT_DIR="$HOME/.config/i3blocks"
