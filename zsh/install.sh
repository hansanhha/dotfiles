#!/bin/bash
set -e
set -o pipefail

cd "$(dirname "${BASH_SOURCE}")";

read -p "This way overwrite existing files in your home directory. Are you
    sure? (y/n) " -n 1;

echo "";

if ! [[ $REPLY =~ ^[Yy]$ ]]; then
    exit 0;
fi;

rsync --exclude 'install.sh' -avh --no-perms . ~;

# Check if Git is installed
if ! command -v git > /dev/null 2>&1; then
    installgit
fi;

# Check if Oh-My-Zsh is installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
fi;

# oh-my-zsh plugin installing
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

installgit() 
{
    OS=$(uname -s);
    case $OS in
        Linux)
            # Check the Linux distro
            if grep -qEi "(debian|ubuntu)" /etc/os-release; then
                sudo apt-get update
                sudo apt-get install git -y
            elif grep -qEi "(fedora|redhat)" /etc/os-release; then
                sudo yum install git -y
            fi;
        ;;
        Darwin)
            # Check if Homebrew is installed 
            if ! command -v brew > /dev/null 2>&1; then
                curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
            fi; 
            brew install git;
        ;;  
        CYGWIN*|MINGW32*|MSYS*|MINGW*)
        ;;
    esac
}

source ~/.zshrc;
unset installgit
