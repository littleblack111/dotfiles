#!/bin/sh
# POLYWINS

# SETTINGS {{{ ---

active_text_color="#f44336"
active_underline="false"
active_underline_color="#E7A09E"
inactive_text_color="#a40000"
inactive_underline="false"
inactive_underline_color="#F1EF7D"
separator="·"
show="window_class" # options: window_title, window_class, window_classname
char_limit=20 # useful with window_title
max_windows=4 # maximum number of displayed windows
char_case="normal" # options: normal, upper, lower
add_spaces="true"
resize_increment=50
wm_border_width=0 # setting this might be required for accurate resize position
ignore_windows="polybar:yad" # :-separated list of windows we want to ignore (bars, desktop managers, etc.)

# --- }}}

case "$1" in
raise_or_minimize)
	if [ "$3" = "$2" ]; then
		wmctrl -ir "$2" -b toggle,hidden
	else
		wmctrl -ia "$2"
	fi
	;;
close)
	wmctrl -ic "$2"
	;;
slop_resize)
	wmctrl -ia "$2"
	wmctrl -ir "$2" -e "$(slop -f 0,%x,%y,%w,%h)"
	;;
increment_size)
	wmctrl -ir "$2" -e "$(wmctrl -G -l |
		awk -v i="$resize_increment" \
		    -v b="$wm_border_width" \
		    -v win="$2" \
		'$1 ~ win {print "0,"$3-b*2-i/2","$4-b*2-i/2","$5+i","$6+i}')"
	;;
decrement_size)
	wmctrl -ir "$2" -e "$(wmctrl -G -l |
		awk -v i="$resize_increment" \
		    -v b="$wm_border_width" \
		    -v win="$2" \
		'$1 ~ win {print "0,"$3-b*2+i/2","$4-b*2+i/2","$5-i","$6-i}')"
	;;
esac

if [ -n "$2" ]; then exit; fi

xprop -root -notype -spy _NET_ACTIVE_WINDOW _NET_CURRENT_DESKTOP _NET_CLIENT_LIST | \
"/home/system/.config/bspwm/scripts/polywins.awk" \
	-v active_text_color="$active_text_color" \
	-v active_underline_color="$active_underline_color" \
	-v active_underline="$active_underline" \
	-v inactive_text_color="$inactive_text_color" \
	-v inactive_underline_color="$inactive_underline_color" \
	-v inactive_underline="$inactive_underline" \
	-v separator="$separator" \
	-v show="$show" \
	-v char_case="$char_case" \
	-v char_limit="$char_limit" \
	-v add_spaces="$add_spaces" \
	-v on_click="$0" \
	-v max_windows="$max_windows" \
	-v ignore_windows="$ignore_windows"
