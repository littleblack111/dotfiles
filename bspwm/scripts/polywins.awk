#!/usr/bin/awk -f

BEGIN {
	# Setup
	active_left="%{F"active_text_color"}"
	active_right="%{F-}"
	inactive_left="%{F"inactive_text_color"}"
	inactive_right="%{F-}"
	separator="%{F"inactive_text_color"}"separator"%{F-}"

	if (active_underline == "true") {
		active_left=active_left"%{+u}%{u"active_underline_color"}"
		active_right="%{-u}"active_right
	}

	if (inactive_underline == "true") {
		inactive_left=inactive_left"%{+u}%{u"inactive_underline_color"}"
		inactive_right="%{-u}"inactive_right
	}

	split(ignore_windows, ignored, ":")

	cmd = "wmctrl -lx"
}

function update_windows()
{
	window_count = 0
	hidden_windows = 0

	while (cmd | getline) {
		if ($2 != active_workspace && $2 != "-1") { continue }

		is_ignored = 0
		for (window in ignored) {
			if ($3 ~ ignored[window]) {
				is_ignored = 1
				break
			}
		}

		if (is_ignored) {
			continue
		}

		if (window_count != 0) {
			# only on non-first items
			if (add_spaces == "true")
				printf " %s ", separator
			else
				printf "%s", separator
		}

		if (window_count >= max_windows) {
			do ++hidden_windows
			while (cmd | getline)

			printf "+%s", hidden_windows
			break
		}

		if (show == "window_class") {
			displayed_name = $3
			sub(/.+\./, "", displayed_name)
		}
		else if (show == "window_classname") {
			displayed_name = $3
			sub(/\..+/, "", displayed_name)
		}
		else if (show == "window_title") {
			# format window title from wmctrl output
			title = ""

			for (i = 5; i <= NF; i++) {
				title = title $i
				if (i != NF) title = title " "
			}

			displayed_name = title
		}

		if (char_case == "lower")
			displayed_name = tolower(displayed_name)
		else if (char_case == "upper")
			displayed_name = toupper(displayed_name)

		if (length(displayed_name) > char_limit)
			displayed_name = substr(displayed_name, 1, char_limit)"…"

		if ($1 == active_window)
			displayed_name=active_left displayed_name active_right
		else
			displayed_name=inactive_left displayed_name inactive_right

		printf "%s%s%s%s%s%s%s",
			"%{A1:"on_click" raise_or_minimize "$1" "active_window":}",
			"%{A2:"on_click" close "$1":}",
			"%{A3:"on_click" slop_resize "$1":}",
			"%{A4:"on_click" increment_size "$1":}",
			"%{A5:"on_click" decrement_size "$1":}",
			displayed_name,
			"%{A}%{A}%{A}%{A}%{A}"

		++window_count
	} close(cmd)

	printf "\n"
	fflush(stdout)
}

$1 == "_NET_CURRENT_DESKTOP" {
	active_workspace = $3
	update_windows()
}

$1 == "_NET_ACTIVE_WINDOW:" && ($5 != "0x0") {
	# makes $5 long at least 10 characters if it is not already
	if (length($5) < 10)
		$5 = sprintf("0x%0" (10 - length($5)) "d%s", 0, substr($5, 3))

	active_window = $5
	update_windows()
}

$1 == "_NET_CURRENT_DESKTOP:" {
	update_windows()
}
