#!/bin/bash

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

slink() {
    if [ -d $1 ]; then
        sudo mv $1/* /usr/share/$2
        rm -rf $1
    fi
    ln -sv /usr/share/$2 $1
}

set -u

# Icons
echo "Setting up icon symlinks..."
slink $XDG_DATA_HOME/icons icons
slink $HOME/.icons icons

# Themes
echo "Setting up theme symlinks..."
slink $XDG_DATA_HOME/themes themes
slink $HOME/.themes themes

# Fonts
echo "Setting up font symlinks..."
slink $XDG_DATA_HOME/fonts fonts
slink $HOME/.fonts fonts
fc-cache -f

# Applications
echo "Setting up application symlinks..."
slink $XDG_DATA_HOME/applications applications

# MIME
echo "Setting up MIME symlinks..."
slink $XDG_DATA_HOME/mime mime

