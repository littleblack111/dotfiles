#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CARD="$(light -L | grep 'backlight' | head -n1 | cut -d'/' -f3)"
INTERFACE="$(ip link | awk '/state UP/ {print $2}' | tr -d :)"
RFILE="$DIR/.module"

# Fix backlight and network modules
fix_modules() {
	if [[ -z "$CARD" ]]; then
		sed -i -e 's/backlight/bna/g' "$DIR"/config.ini
	elif [[ "$CARD" != *"intel_"* ]]; then
		sed -i -e 's/backlight/brightness/g' "$DIR"/config.ini
	fi

	if [[ "$INTERFACE" == e* ]]; then
		sed -i -e 's/network/ethernet/g' "$DIR"/config.ini
	fi
}

# Launch the bar
launch_bar() {
	# Terminate already running bar instances
	#killall -q polybar
    if pgrep polybar > /dev/null; then
        polybar-msg cmd restart
    elif ! pgrep polybar > /dev/null; then

        # Wait until the processes have been shut down
        while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

        # Launch the bar
        for mon in $(polybar --list-monitors | cut -d":" -f1); do
            MONITOR=$mon polybar -q main -c "$DIR"/config.ini &
        done
    else
        echo "An error had occured"
    fi
}

# Execute functions
if [[ ! -f "$RFILE" ]]; then
	fix_modules
	touch "$RFILE"
fi
launch_bar
