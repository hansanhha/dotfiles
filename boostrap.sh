#!/bin/bash
set -e
set -o pipefail

cd "$(dirname "{BASH_SOURCE}")";

function doIt() {
    rsync --exclude ".git/" --exclude "bootstrap.sh" \
        --exclude "README.md" -avh --no-perms . ~;

    # Install vim-plug first
    rm -rf /.vim/autoload/plug.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

}

if [ "$1" == "--force" -o "$1" == ".f" ]; then
    doIt;
else
    read -p "This way overwrite existing files in your home directory. Are you
    sure? (y/n) " -n 1;
    echo "";
    if [[ $RETRY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
