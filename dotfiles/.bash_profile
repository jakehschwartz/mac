alias json2="pbpaste | sed 's/\\\\//g' | python -m json.tool"
alias json="pbpaste | python -m json.tool"
alias utc='zdump UTC'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# Git Bash Completion and Prompt - https://dev.to/gonedark/tweak-your-terminal-for-git
[[ -f "$HOME/.git_completion.bash" ]] && source "$HOME/.git_completion.bash"
[[ -f "$HOME/.git_prompt.sh" ]] && source "$HOME/.git_prompt.sh"
[[ -f "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"

eval "$(thefuck --alias)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#AWS Config
if [ -f $(brew --prefix)/etc/bash_completion.d/um-completion.sh ]; then
  . $(brew --prefix)/etc/bash_completion.d/um-completion.sh
fi
