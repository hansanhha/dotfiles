#!/bin/bash
set -e
set -o pipefail

cd "$(dirname "{BASH_SOURCE}")";

function doIt() {
    rsync --exclude ".git/" --exclude "bootstrap.sh" \
        --exclude "README.md" -avh --no-perms . ~;

    # Check if vim is installed
    if ! command -v vim >/dev/null 2>&1; then
        echo "Vim is not installed. Installing..."

        # Check the Linux distro
        if grep -qEi "(debian|ubuntu)" /etc/os-release; then
            sudo apt-get update
            sudo apt-get install vim -y
        elif grep -qEi "(fedora|redhat)" /etc/os-release; then
            sudo yum install vim -y
    fi

    # Install vim-plug first
    rm -rf /.vim/autoload/plug.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    vim +PlugInstall +qall

    # if on Linux set the Caps_Lock key change the function to hangul key
    if [[ "$(uname)" == "Linux" ]; then

        read -p "Do you want to change the function of the caps_lock key to a Korean/English conversion key? (y/n)" -n 1;
        echo "";
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "Requires reboot to apply the changed caps_lock key function"
            xmodmap .Linux-Xmodmap
        fi;
    fi;

}

if [ "$1" == "--force" -o "$1" == ".f" ]; then
    doIt;
else
    read -p "This way overwrite existing files in your home directory. Are you
    sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
