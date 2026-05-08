hl.config({
	group = {
		auto_group = false,
		-- disbandgrouponnone = true,
		groupbar = {
			-- enabled = false,
			render_titles = false,
			text_color = colors.foreground,
			col = {
				active = colors.color0,
				inactive = colors.background,
				locked_active = colors.color0,
				locked_inactive = colors.background,
			},
		},
		col = {
			border_active = { colors = { colors.color0, colors.color15, colors.foreground, colors.cursor } },
			border_inactive = colors.background,
			border_locked_active = { colors = { colors.color0, colors.background } },
			border_locked_inactive = colors.background,
		},
	}
})
