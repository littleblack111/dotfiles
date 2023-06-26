#!/usr/bin/bash

printf "[*] Checking if system have required packages and commands\n"
if ! command -v git > /dev/null; then
    printf "[*] git: command not found\n"
    if command -v pacman > /dev/null; then
        printf "pacman detected, installing dependencys\n"
        sudo pacman -S git --noconfirm
    elif command -v apt-get > /dev/null; then
        printf "apt-get detected, installing dependencys\n"
        sudo apt-get -y git
    elif command -v yum > /dev/null; then
        printf "yum detected, installing dependencys\n"
        sudo yum install -y git
    elif command -v zypper > /dev/null; then
        printf "zypper detected, installing dependencys\n"
        sudo zypper install -y git
    elif command -v emerge > /dev/null; then
        printf "emerge detected, installing dependencys\n"
        emerge git
    elif command -v nix > /dev/null; then
        printf "nix detected, installing dependencys\n"
        nix-env -iA nixpkgs.git
    else
        printf "please install git with your package manager(git-scm.com/book/en/v2/getting-started-installing-git)\n"
        exit 127
    fi
elif ! command -v cp > /dev/null; then
    printf "[*] cp: command not found\n"
    exit 127
elif ! command -v rm > /dev/null; then
    exit 127
fi


printf "[*] Cloning gh repo into /tmp/dots.tmp\n"
git clone https://github.com/littleblack111/dotfiles.git /tmp/dots.tmp --recurse-submodules || ec=$?; printf "An error had occured during git clone\n"; exit $ec
printf "[*] Copying configs from /tmp/dots.tmp to $HOME/.config/\n"
cp -vri /tmp/dots.tmp/* $HOME/.config/ || ec=$?; printf "An error had occured during copy\n"; exit $ec
printf "[*] Deleting temporary files...\n" 
rm -vrf /tmp/dots.tmp || ec=$?; printf "An error had occured during deletion\n"; exit $ec
