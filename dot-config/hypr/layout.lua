hl.config({
	general = {
				layout           = "scrolling",
			},

	dwindle = {
		preserve_split = true, -- You probably want this
		force_split = 3,
		precise_mouse_move = true
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
	master = {
		new_status = "inherits",
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
	scrolling = {
		follow_min_visible = 0.01,
		fullscreen_on_one_column = true,
		-- explicit_column_widths = 0.333,
		-- 0.5,
		-- 0.667,
		-- 1.0
		-- focus_fit_method = 1
	},
})
