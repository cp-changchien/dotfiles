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
> [!NOTE]  
> tmux might require to be setup additionally, since the tmp (Tmux Plugin Manager) cannot be git. <br/>
> Follow the below procedure to install and finish tmux configuration

First, clone the repo to install tpm
```command line
# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Once install, source the tmux.conf file (wheryou store your tmux.conf file)
tmux source ~/.dotfiles/.config/tmux/tmux.conf
```


### Windows
For a Windows distribution, it is recommended to install PowerShell with winget commands,
```command line
# Install Neovim
winget install --id=Neovim.Neovim  -e

# Install git
winget install -e --id Git.Git
```

On Windows, NeoVim gets its configuration from %userprofile%\AppData\Local\nvim and keeps its data in %userprofile%\AppData\Local\nvim-data. <br />
Therefore, by cloning the /.config file from the repo, we also need to link our /.config/nvim folder to the said configuration folder, this can be achieved by the following commmand,
```command line
# clone Dotfiles repo
$dotFilesRoot = Join-Path $HOME "dotfiles"

if (!(Test-Path $dotFilesRoot -PathType Container)) {
    git clone https://github.com/cp-changchien/dotfiles.git $dotFilesRoot
}
```
Then run the following command to link
```command line
# link NeoVim configuration
$localConfiguration = Join-Path $env:LOCALAPPDATA "nvim"
$dotfilesConfiguration = Join-Path $dotFilesRoot ".config" "nvim"

if (!(Test-Path $localConfiguration -PathType Container)) { 
    Start-Process -FilePath "pwsh" -ArgumentList "-c New-Item -Path $localConfiguration -ItemType SymbolicLink -Value $dotfilesConfiguration".Split(" ") -Verb runas
}
```

After this, reboot the system and run nvim to enter Neovim environment to check the configuration.<br />
Run the following command to install plugins in custom.lua
```command line
# Mason Install the custom plugins
:MasonInstallAll
```

#### oh-my-posh 
To configure terminal theme, first install oh-my-posh by the following command
```command line
# Install oh-my-posh
winget install JanDeDobbeleer.OhMyPosh -s winget

# To check, run
oh-my-posh

# Run to display the $PROFILE location to be edited
echo $PROFILE
```

To configure the theme and other aliases, 
```command line
cd Documents
mkdir PowerShell
cd Powershell
nvim Microsoft.PowerShell_profile.ps1
```

Once the file is created, to initialise the default theme, enter the following in the script
```command line
# Neovim script
# Aliases
Set-Alias g git
Set-Alias vim nvim

#Prompt
oh-my-posh init pwsh | Invoke-Expression
```

An URL pointing to a remote config is recommended, replace the above line with (using catppuccin_mocha for example, more themes [here](https://ohmyposh.dev/docs/themes))
```command line
# Neovim script
#Prompt
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_mocha.omp.json' | Invoke-Expression
```

> [!IMPORTANT]
> C Compiler might be required to install for Windows, by searching [MinGW SourceForge page](https://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download) and install mingw-get-setup.exe. <br />
> Follow the steps in this [link](https://dev.to/gamegods3/how-to-install-gcc-in-windows-10-the-easier-way-422j)















