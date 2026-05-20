# Sequoia Snow's .config

This repo is an archive for all dotfiles, using
[chezmoi](https://www.chezmoi.io). In order to set up a new laptop you can use

```sh 
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

## Prerequisites 

In order to properly apply the changes (including installing the appropriate
brew packages) first install homebrew and download the xcode command line tools
via

```sh
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

