hl.config({
	general = {		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing    = true,
},
	render = {
		direct_scanout = 1,
		-- xp_mode = true, -- crazy drag bg
		new_render_scheduling = true,
		ctm_animation = 1,
	},
})
