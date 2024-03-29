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

# Check if vim is installed
#
if ! command -v vim > /dev/null 2>&1; then
    echo "Vim is not installed. Installing..."
    
    # Check the Linux distro
    if grep -qEi "(debian|ubuntu)" /etc/os-release; then
        sudo apt-get update
        sudo apt-get install vim -y
    elif grep -qEi "(fedora|redhat)" /etc/os-release; then
        sudo yum install vim -y
    fi
fi

# Install vim-plug first
echo "Installing plugin...\n"
rm -rf /.vim/autoload/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

