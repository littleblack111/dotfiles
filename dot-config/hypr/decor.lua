hl.config({
	general = {
		gaps_in     = 3,
		gaps_out    = 7,
		float_gaps  = -1,
		border_size = 3,

		col         = {
			active_border   = { colors = { colors.color15, colors.color13, colors.color10, colors.color8, colors.color6, colors.color4, colors.color2, colors.color0, } }, -- angle = 45
			inactive_border = colors.background,
		},
	},

	decoration = {
		rounding              = 7,
		rounding_power        = 10,
		border_part_of_window = true,

		-- Change transparency of focused and unfocused windows
		-- active_opacity = 0.95
		inactive_opacity      = 0.85,
		fullscreen_opacity    = 1.0,

		shadow                = {
			enabled = true,
			range = 15,
			render_power = 4,
			-- sharp = true,
			-- ignore_window = true,
			color = colors.background,
			-- color = rgba(1a1a1aee),
		},

    screen_shader = "/usr/share/hyprshade/shaders/vibrance.glsl",

		blur                  = {
			enabled = true,
			-- heavy,
			size = 5, -- 10,
			passes = 5, -- 4,
			-- light,
			-- size = 8,
			-- passes = 3,
			--       noise = 0,
			-- crazy & cool options,
			-- brightness = 1,
			-- contrast = 2,
			-- vibrancy = 1.5,
			-- vibrancy_darkness = 1,
			popups = true,
			ignore_opacity = true, -- KEEP THIS, THIS MAKE BLUR ACTUALLY BLUR COOL
			input_methods = true,
			special = true,
		},
	},

	animations = {
		enabled = true,
	},
})


-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })

-- -- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

-- hl.curve("windowovershot", { type = "bezier", points = { {1, 1}, {0, 1.05} } })
-- hl.curve("overshot", { type = "bezier", points = { {0.5, 1}, {0, 1.2} } })
-- hl.curve("sovershot", { type = "bezier", points = { {0.5, 1}, {0, 1.1} } })
-- -- hl.curve("outsideIn", { type = "bezier", points = { {0.5, 1.1}, {0, 0.9} } })
-- hl.curve("slow-fast", { type = "bezier", points = { {1, 0.33}, {0.3, 1} } })
hl.curve("fast-slow", { type = "bezier", points = { { 0.33, 0.8 }, { 0, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
-- -- hl.curve("md3_standard", { type = "bezier", points = { {0.2, 0}, {0, 1} } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
-- -- hl.curve("md3_accel", { type = "bezier", points = { {0.3, 0}, {0.8, 0.15} } })
-- -- hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })
-- -- hl.curve("crazyshot", { type = "bezier", points = { {0.1, 1.5}, {0.76, 0.92} } })
-- -- hl.curve("hyprnostretch", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })
-- -- hl.curve("menu_decel", { type = "bezier", points = { {0.1, 1}, {0, 1} } })
-- -- hl.curve("menu_accel", { type = "bezier", points = { {0.38, 0.04}, {1, 0.07} } })
-- -- hl.curve("easeInOutCirc", { type = "bezier", points = { {0.85, 0}, {0.15, 1} } })
-- -- hl.curve("easeOutCirc", { type = "bezier", points = { {0, 0.55}, {0.45, 1} } })
-- -- hl.curve("easeOutExpo", { type = "bezier", points = { {0.16, 1}, {0.3, 1} } })
-- -- hl.curve("softAcDecel", { type = "bezier", points = { {0.26, 0.26}, {0.15, 1} } })
-- hl.curve("md2", { type = "bezier", points = { {0.4, 0}, {0.2, 1} } }) -- use with .2s duration

hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "md3_decel" })

-- hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "overshot", style = "gnome" })
-- -- hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "slow-fast", style = "popin 15%" })
-- hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "slow-fast", style = "popin 15%" })
-- -- hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, bezier = "md3_accel" }) -- when new window appears, it will block it for a while since its slower then windowIn animation
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "fast-slow", style = "slide" })
-- hl.animation({ leaf = "workspacesIn", enabled = true, speed = 5, bezier = "fast-slow", style = "slidefade" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 100, bezier = "linear", style = "loop" })

-- hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "sovershot", style = "popin 15%" })

hl.animation({ leaf = "zoomFactor", enabled = true, speed = 3, bezier = "fast-slow" })

hl.curve("spring", { type = "spring", mass = 3, stiffness = 200, dampening = 35 })

hl.curve("layer", { type = "spring", mass = 4, stiffness = 450, dampening = 50 })

hl.curve("open", { type = "spring", mass = 4, stiffness = 300, dampening = 46 })
hl.curve("move", { type = "spring", mass = 4, stiffness = 375, dampening = 48 })

hl.curve("workspace", { type = "spring", mass = 4, stiffness = 325, dampening = 50 })
hl.curve("workspaceIn", { type = "spring", mass = 4, stiffness = 375, dampening = 51 })

-- hl.curve("zoom", { type = "spring", mass = 3, stiffness = 225, dampening = 38 })

hl.animation({ leaf = "global", enabled = true, speed = 3, spring = "spring" })

hl.animation({ leaf = "layers", enabled = true, speed = 3, spring = "layer" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, spring = "open" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, spring = "move" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 3, spring = "workspace" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3, spring = "workspaceIn", style = "slidefade" })

-- hl.animation({ leaf = "zoomFactor", enabled = true, speed = 3, spring = "zoom" })
