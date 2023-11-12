# dotfiles
This repo contains my dotfile configuration, allowing for a consistent computing experience across multiple machines. 

## How to Install
### MacOS
For an MacOS dsitribution, it is recommended to install Apple's Command Line Tools using Homebrew
```command line
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Apple's Command Line Tools
xcode-select --install
```
After installing Homebrew and Command Line Tool, clone the repo into a new hidden directory (e.g. ~/.dotfiles)
```command line
# Using HTTPS
git clone https://github.com/cp-changchien/dotfiles.git ~/.dotfiles
```
The various configuration files in this repo are linked using [GNU Stow](https://www.gnu.org/software/stow/). This allows setting up symlinks for all dotfiles using a single command:

```command line
brew install stow
cd ~/.dotfiles
stow .
```
