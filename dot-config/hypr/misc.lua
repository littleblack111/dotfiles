hl.config({
	general = {
		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		snap             = {
			enabled = true,
			respect_gaps = true
		},

	},
	misc = {
		force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers,
		focus_on_activate = true,
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(,
		disable_autoreload = false,
		-- vfr = false,
		-- vrr = 1 -- 1 = always, 2 = only in full screen,
		-- mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		-- animate_manual_resizes = true,
		-- animate_mouse_windowdragging = true,
		middle_click_paste = false,
		enable_swallow = false,
		-- swallow_regex = ^(Alacritty)$,
		-- new_window_takes_over_fullscreen = 2,
	},

	ecosystem = {
    no_donation_nag = true,
    no_update_news = true,
	enforce_permissions = 1
	}
})
