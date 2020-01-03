source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# Load the theme
antigen theme robbyrussell

antigen apply
