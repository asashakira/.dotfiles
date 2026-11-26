# Two-line prompt on top of robbyrussell:
#   [aws:my-profile] ➜ dir git:(branch) ✗
#   ❯ your command here
# The aws tag only appears when AWS_PROFILE is set (prompt_subst is on via omz).
_aws_profile_tag() {
  [[ -n $AWS_PROFILE ]] && print -n "%{$fg[yellow]%}[aws:$AWS_PROFILE]%{$reset_color%} "
}
PROMPT='$(_aws_profile_tag)'"$PROMPT"
PROMPT+=$'\n''%{$fg_bold[blue]%}❯%{$reset_color%} '
