# FZF
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# nvm
export NVM_DIR="$HOME/ghq/github.com/nvm-sh/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
