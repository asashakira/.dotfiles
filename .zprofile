# pyenv
export PYENV_ROOT=$HOME/source/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# pyenv-virtualenv
# eval "$(pyenv virtualenv-init -)"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
