#!/usr/bin/env bash

# bspwm directory
DIR="$HOME/.config/dunst"

# Launch dunst daemon
if [[ `pidof dunst` ]]; then
	pkill dunst
fi

dunst -config "$DIR"/dunstrc &
