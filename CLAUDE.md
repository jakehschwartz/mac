# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal macOS dotfiles and machine setup automation for Jake Schwartz's Mac mini. It handles bootstrapping a new Mac from scratch.

## Key Files

- `setup.sh` — Entry point for new machine setup: installs Xcode CLI tools, Homebrew, Powerline fonts, SDKMAN, then runs `brew bundle`, and symlinks all dotfiles
- `Brewfile` — All Homebrew formulae, casks, and Mac App Store apps (managed via `brew bundle`)
- `dotfiles/` — Config files symlinked to `~/.<filename>` by `setup.sh`
- `copy/setup.sh` — macOS system `defaults` preferences (Finder, Dock, trackpad, screensaver, etc.)

## How Dotfiles Are Installed

`setup.sh` creates symlinks for every file in `dotfiles/` to `~/.<filename>`:
```bash
cd dotfiles && for i in `ls`; do ln -s $PWD/$i ~/.$i; done
```
So `dotfiles/zshrc` → `~/.zshrc`, `dotfiles/gitconfig` → `~/.gitconfig`, etc.

## Shell Environment (zshrc)

- Plugin manager: **antidote** (replaces antigen/antibody)
- Prompt: **starship** — config lives at `dotfiles/starship.toml`, loaded via `STARSHIP_CONFIG=~/Dev/dotfiles/starship.toml`
- Node version manager: **nvm** (via Homebrew)
- Python: managed via Homebrew's `python@3.14`, on PATH via `$HOMEBREW_PREFIX/opt/python@3.14/libexec/bin`
- JVM toolchain: **SDKMAN** (must be sourced last in zshrc)
- `HOMEBREW_PREFIX` is resolved dynamically via `brew --prefix` if not already set

Key aliases in `zshrc`:
- `json` — pretty-print clipboard JSON with color (`pbpaste | jq -C "."`)
- `brewup` — full Homebrew maintenance cycle
- `mux` — tmuxinator

## Git Config Notable Settings

- Diff tool: `icdiff` with line numbers
- Merge conflict style: `zdiff3`
- Rebase: `autosquash = true`
- git-absorb: `autoStageIfNothingStaged = true`
- Push: `autoSetupRemote = true`
- Branch prefix convention (gitflow): features/bugfixes use `ENG-` prefix

## tmux Config

- Prefix remapped from `C-b` → `C-a`
- Split: `-` for vertical, `\` for horizontal (preserves current path)
- Pane navigation: `Alt-Arrow` (no prefix needed)
- Copy mode: vim keybindings; `v` to select, `y` to copy via `pbcopy`
- Plugin manager: **tpm** (`~/.tmux/plugins/tpm/tpm`)

## Updating the Brewfile

After installing or removing packages:
```bash
brew bundle dump --force  # overwrite Brewfile with current state
```

To install everything from the Brewfile on a new machine:
```bash
brew bundle
```
