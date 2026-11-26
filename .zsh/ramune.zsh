# competitive programming
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gpp="g++ -std=gnu++20 -O2 -Wall -Wextra -o a"
alias a="./a"

# opts
unsetopt share_history
unsetopt AUTO_CD

# setup direnv
eval "$(direnv hook zsh)"

# fzf for ghq
fzf-src () {
    local repo=$(ghq list | fzf --query="$LBUFFER" --reverse)
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact "$repo")
        BUFFER="cd ${repo}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-src
bindkey '^F' fzf-src

# open github repo in browser
open-github () {
    local REMOTE_URL=$(git remote get-url origin 2>/dev/null)

    if [[ $REMOTE_URL != *"github.com"* ]]; then
        echo "Error: Current directory is not a github repository"
        return 1
    fi

    # Extract Repo Name: everything after the last slash
    local REPO_NAME=$(echo "$REMOTE_URL" | sed 's/.*\///')

    echo "Opening $REPO_NAME..."
    wslview "$REMOTE_URL"
}


awsp() {
  local profile
  profile=$(
    grep -E '^\[profile ' ~/.aws/config |
      sed -E 's/^\[profile (.+)\]$/\1/' |
      fzf --prompt='AWS profile › ' --height=40% --reverse \
  ) || return

  export AWS_PROFILE="$profile"
  echo "AWS_PROFILE=$profile"

  if ! aws sts get-caller-identity --no-cli-pager >/dev/null 2>&1; then
    echo "Session expired or missing — running sso login..."
    aws sso login --profile "$profile" || return
  fi

  aws sts get-caller-identity --no-cli-pager
}

show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    # Extracts 'py313' from the path or uses VIRTUAL_ENV_PROMPT if set
    echo "${VIRTUAL_ENV_PROMPT:-$(basename "$VIRTUAL_ENV")} "
  fi
}
# Update your PS1 to include the function output
# This prepends the env name to your existing prompt
export PS1="\$(show_virtual_env)$PS1"

export AWS_PAGER=""
