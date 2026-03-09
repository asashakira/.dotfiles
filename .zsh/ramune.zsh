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
