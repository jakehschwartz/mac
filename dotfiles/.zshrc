source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle autojump
antigen bundle brew
antigen bundle common-aliases
antigen bundle copyfile
antigen bundle fzf
antigen bundle git
antigen bundle httpie
antigen bundle osx
antigen bundle sbt
antigen bundle thefuck

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# Virtual environment niceities
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv

# Load the theme
antigen theme robbyrussell

antigen apply

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

alias json="pbpaste | fx ."
alias utc='zdump UTC'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

