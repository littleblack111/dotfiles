#!/bin/bash

printf "[*] Checking if system have required packages and commands\n"
if command -v gh > /dev/null; then
    ghc=true
fi
# since it's dangours, so removed.
#if command -v rsync > /dev/null; then
#    rsyncc=true
#fi
if ! command -v bspc > /dev/null; then
    printf "[!] bspc: command not found\nthis program is for bspwm config, please install bspwm\n"
    exit 127
fi
if ! command -v picom > /dev/null; then
    printf "[!] picom: command not found\nthis program is for picom, please install picom\n"
    exit 127
fi

if [ $ghc != true ]; then
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
fi

if [ -e /tmp/dots.tmp ]; then
    printf "[!] /tmp/dots.tmp exist, deleting\n"
    rm -rf /tmp/dots.tmp
fi
if [ -e /tmp/picom.tmp ]; then
    printf "[!] /tmp/picom.tmp exist, deleting\n"
    rm -rf /tmp/picom.tmp
fi


printf "[*] Cloning gh repo into /tmp/dots.tmp\n"
if [ $ghc = true ]; then
    gh repo clone littleblack111/dotfiles /tmp/dots.tmp -- --recurse-submodules #|| ec=$?; printf "An error had occured during gh repo clone dotfiles\n"; exit $ec
    gh repo clone littleblack111/picom-fdev-ft-labs-merge /tmp/picom.tmp || ec=$?; printf "An error had occured during gh repo clone picom\n"; exit $ec
else
    git clone https://github.com/littleblack111/dotfiles.git /tmp/dots.tmp --recurse-submodules #|| ec=$?; printf "An error had occured during git clone\n"; exit $ec
    git clone https://github.com/littleblack111/picom-fdev-ft-labs-merge.git /tmp/picom.tmp || ec=$?; printf "An error had occured during git clone picom\n"; exit $ec
fi

printf "[*] Installing configs from /tmp/dots.tmp to $HOME/.config/\n"
# this will override.
#if [ $rsyncc = true ]; then
#    rsync -avxHAXP --exclude '.git*' /tmp/dots.tmp/* ~/.config
#fi
cp -vri /tmp/dots.tmp/* $HOME/.config/ || ec=$?; printf "An error had occured during installation(copy)\n"; exit $ec
printf "[*] Build & Installing picom\n"
cd /tmp/picom.tmp && git submodule update --init --recursive && meson setup --buildtype=release . build && ninja -C build || ec=$?; printf "An error had occured during Build/Install of picom"; exit $ec
printf "[*] Deleting temporary files\n"
rm -vrf /tmp/dots.tmp /tmp/picom.tmp || ec=$?; printf "An error had occured during deletion\n"; exit $ec
printf "[!] Successfully installed configs\n"
printf "[*] Applying config, restarting bspWM\n"
bspc wm -r  || ec=$?; printf "An error had occured during application\n"; exit $ec
printf "[*] Applying picom, restarting picom\n"
killall picom && picom &
printf "[!] Successfully installed and applied dots\n"

printf "[!] All done. Exiting...\n"
exit 0
