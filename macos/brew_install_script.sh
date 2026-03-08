#!/bin/bash

set -eu

echo "Starting Installation"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed"
fi

# Update homebrew recipes
brew update
brew upgrade

PACKAGES=(
    awscli
    bash
    bat
    docker
    dotnet
    eza
    fd
    fzf
    go
    graphviz
    hugo
    neovim
    node
    openjdk
    python3
    ripgrep
    starship
    stow
    terraform
    terraform-rover
    topgrade
    wget
    yazi
    zsh-completions
)

echo "Installing packages..."
brew install "${PACKAGES[@]}"

CASKS=(
    aws-vault
    brave-browser
    calibre
    firefox
    hiddenbar
    jetbrains-toolbox
    microsoft-office
    nextcloud
    obsidian
    protonvpn
    raycast
    spotify
    thunderbird
    todoist
    visual-studio-code
    vlc
    wezterm
)

echo "Installing cask apps..."
brew install --cask "${CASKS[@]}"

echo "Download pkg for software to install manually"
curl -o ~/Downloads/pp_vpn.pkg https://www.perfect-privacy.com/downloads/Perfect_Privacy_VPN.pkg
