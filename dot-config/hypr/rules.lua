--------------------------------------
--- WINDOWS AND WORKSPACES         ---
--------------------------------------
-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- Dynamically fetch exact gaps and monitor reserved space (Waybar)
local function get_env_offsets()
	-- 1. Rip gaps directly from the active config
	local gaps_cfg = hl.get_config("general.gaps_out")
	local gt, gb, gl, gr = 0, 0, 0, 0
	if type(gaps_cfg) == "table" then
		gt = gaps_cfg.top or gaps_cfg[1] or 0
		gb = gaps_cfg.bottom or gaps_cfg[3] or 0
		gl = gaps_cfg.left or gaps_cfg[4] or 0
		gr = gaps_cfg.right or gaps_cfg[2] or 0
	elseif type(gaps_cfg) == "number" then
		gt, gb, gl, gr = gaps_cfg, gaps_cfg, gaps_cfg, gaps_cfg
	end

	-- 2. Interrogate the active monitor for reserved space (your bar)
	local bt, bb, bl, br = 0, 0, 0, 0
	local m = hl.get_active_monitor()
	if m and m.reserved then
		if type(m.reserved) == "table" then
			bt = m.reserved.top or m.reserved[1] or 0
			bb = m.reserved.bottom or m.reserved[2] or 0
			bl = m.reserved.left or m.reserved[3] or 0
			br = m.reserved.right or m.reserved[4] or 0
		end
	end

	return {
		top = gt + bt,
		bottom = gb + bb,
		left = gl + bl,
		right = gr + br
	}
end

local offsets = get_env_offsets()

-- workspaces
local tag_workspaces = {
	terminal = 1,
	web = 2,
	file = 3,
	code = 4,
	office = 5,
	communication = 6,
	media = 7,
	games = 8,
	system = 9,
	misc = 10
}

for tag, ws in pairs(tag_workspaces) do
	hl.window_rule({ match = { tag = tag }, workspace = tostring(ws) })
end

-- content hints
hl.window_rule({ match = { tag = "games" }, content = "game" })

-- GUI Utils
hl.window_rule({
	match = { tag = "gui-utils" },
	opacity = "0.85 0.75",
	pin = true,
	size = { "(monitor_w*0.53)", "(monitor_h*0.6)" },
	move = { "(monitor_w-window_w-" .. offsets.right .. ")", tostring(offsets.top) },
	animation = "slide right top"
})

-- media contents
hl.window_rule({
	match = { tag = "media-contents" },
	float = true,
	pin = true,
	no_initial_focus = true,
	no_shadow = true,
	keep_aspect_ratio = true,
	no_dim = true,
	suppress_event = "activatefocus"
})

-- positions
local positions = {
	["top-left"] = { tostring(offsets.left), tostring(offsets.top) },
	["top-right"] = { "(monitor_w-window_w-" .. offsets.right .. ")", tostring(offsets.top) },
	["bottom-left"] = { tostring(offsets.left), "(monitor_h-window_h-" .. offsets.bottom .. ")" },
	["bottom-right"] = { "(monitor_w-window_w-" .. offsets.right .. ")", "(monitor_h-window_h-" .. offsets.bottom .. ")" }
}

for tag, pos in pairs(positions) do
	hl.window_rule({ match = { tag = tag }, move = pos })
end

-- fake fullscreen
hl.window_rule({ match = { tag = "fakefullscreen" }, fullscreen_state = "0 2" })

-- Games
hl.window_rule({ match = { tag = "games" }, fullscreen = true, immediate = true })

-- fh5 & game focus suppression
hl.window_rule({ match = { title = "^(Forza Horizon 5)$" }, suppress_event = "activatefocus" })
hl.window_rule({ match = { class = "^(steam_app_1551360)$" }, suppress_event = "activatefocus" })
hl.window_rule({ match = { tag = "games" }, suppress_event = "activatefocus" })

-- time-sensitive app rules
hl.window_rule({
	match = { tag = "time-sensitive" },
	stay_focused = true,
	pin = true,
	dim_around = true,
	center = true,
	float = true
})

-- popup
hl.window_rule({
	match = { tag = "popup" },
	dim_around = true,
	center = true,
	float = true
})

-- cli util apps
hl.window_rule({
	match = { tag = "cli-utils" },
	float = true,
	pin = true,
	dim_around = true
})

-- hidden
hl.window_rule({ match = { tag = "hidden" }, workspace = "special:minimized silent" })

-- Grouping tags by class/title matches
local app_tags = {
	{ class = "^(Alacritty|Xfce4-terminal|Kitty|" .. (vars.term or "$term") .. "|com.mitchellh.ghostty)$",                                                                                                                                                                                                                                                                                                                                                                                   tag = "+terminal" },
	{ class = "^(" .. (vars.browser or "$browser") .. "|Brave-browser|chromium|firefox|thorium|zen)$",                                                                                                                                                                                                                                                                                                                                                                                       tag = "+web" },
	{ class = "^(" .. (vars.fileManager or "$fileManager") .. "|Pcmanfm|thunar|qBittorrent|Caja)$",                                                                                                                                                                                                                                                                                                                                                                                          tag = "+file" },
	{ class = "^(code|code-url-handler|cursor-url-handler|code-oss|Code - OSS|install4j-burp-StartBurp|burp-StartBurp|Unity|jetbrains-pycharm-ce|Postman|jetbrains-clion|.*\\.zed\\.Zed-.*)$",                                                                                                                                                                                                                                                                                               tag = "+code" },
	{ class = "^(LibreOffice.*|libreoffice.*|Typora|obsidian|figma-linux|anytype|craft-nativefier-e0958b|evince|org.gnome.Evince|ClickUp)$",                                                                                                                                                                                                                                                                                                                                                 tag = "+office" },
	{ class = "^(discord|vesktop|VencordDesktop|Chat-gpt|Whatsapp-for-linux|Chatbox)$",                                                                                                                                                                                                                                                                                                                                                                                                      tag = "+communication" },
	{ class = "^(Audacity|Music|MPlayer|Lxmusic|Inkscape|Gimp|Blender|obs|zoom|Zoom|Pitivi|kdenlive|openshot|vlc|cider|Cider|shotwell|Shotwell|fr.handbrake.ghb|spotify|spotify)$",                                                                                                                                                                                                                                                                                                          tag = "+media" },
	{ class = "^(Minecraft|Badlion|War|steam_proton|steam|csgo_linux64|cs2|minecraft-launcher|lutris|genshinimpact\\.exe|moe\\.launcher\\.an-anime-game-launcher|lunarclient|Lunar Client.*|zenlesszonezero\\.exe|moe\\.launcher\\.sleepy-launcher|org\\.vinegarhq\\.Sober|War Thunder.*|steam_app_.*)$",                                                                                                                                                                                    tag = "+games" },
	{ class = "^(virt-manager|blueman-adapters|blueman-manager|GParted|Xdm-app|timeshift-gtk|com\\.nextcloud\\.desktopclient\\.nextcloud|gearlever|Lxappearance|Lxtask|Lxrandr|Arandr|System-config-printer\\.py|Pavucontrol|Exo-helper-1|Protonvpn|Xfce4-power-manager-settings|Mysql-workbench-bin|Grub-customizer|Nitrogen|archlinux-tweak-tool\\.py|pamac-manager|helvum|Vmware|btrfs-assistant|Bitwarden|wootility-lekker|nwg-look|com\\.github\\.wwmm\\.easyeffects|kvantummanager)$", tag = "+system" },
	{ class = "^(os_server|Os_server)$",                                                                                                                                                                                                                                                                                                                                                                                                                                                     tag = "+misc" },
	{ title = ".*\\.exe",                                                                                                                                                                                                                                                                                                                                                                                                                                                                    tag = "+games" },
	{ title = "^(War Thunder.*)$",                                                                                                                                                                                                                                                                                                                                                                                                                                                           tag = "+games" },
	{ content = "3",                                                                                                                                                                                                                                                                                                                                                                                                                                                                         tag = "+games" },
	{ class = "^(thorium-app.shortwave.com__-Default|thorium-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Profile_1|thorium-lnachpgegbbmnnlgpokibfjlmppeciah-Default|BeeperTexts)$",                                                                                                                                                                                                                                                                                                                     tag = "+gui-utils" },
	{ class = "^(blobdrop|dragon|dragon-drop)$",                                                                                                                                                                                                                                                                                                                                                                                                                                             tag = "+media-contents" },
	{ class = "^(blobdrop|dragon|dragon-drop)$",                                                                                                                                                                                                                                                                                                                                                                                                                                             tag = "+bottom-right" },
	{ title = "^(Picture-in-Picture)$",                                                                                                                                                                                                                                                                                                                                                                                                                                                      tag = "+media-contents" },
	{ title = "^(Picture-in-Picture)$",                                                                                                                                                                                                                                                                                                                                                                                                                                                      tag = "+top-right" },
	{ class = "^(thorium-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Profile_1|thorium-lnachpgegbbmnnlgpokibfjlmppeciah-Default)$",                                                                                                                                                                                                                                                                                                                                                                     tag = "+fakefullscreen" },
	{ class = "^(polkit-gnome-authentication-agent-1|hyprland-share-picker.*|gcr-prompter|io.missioncenter.MissionCenter|hyprpolkitagent|hyprland-dialog|.*pinentry.*)$",                                                                                                                                                                                                                                                                                                                    tag = "+time-sensitive" },
	{ title = "^(Open File|Open|Select a File|Choose wallpaper|Open Folder|Save As|Save File|Open Files|File Operation Progress|Library|File Upload|.*- Properties|Enter name of file to save to.*)$",                                                                                                                                                                                                                                                                                       tag = "+popup" },
	{ class = "^(xdg-desktop-portal.*|.*\\.portal..*)$",                                                                                                                                                                                                                                                                                                                                                                                                                                     tag = "+popup" },
	{ class = "^thunar$",                                                                                                                                                                                                                                                                                                                                                                                                                                                                    title = "^Rename.*",      tag = "+popup" },
	{ class = "^zenity$",                                                                                                                                                                                                                                                                                                                                                                                                                                                                    title = "^Protontricks$", tag = "+popup" },
	{ class = "^zen$",                                                                                                                                                                                                                                                                                                                                                                                                                                                                       title = "^Extension:.*",  tag = "+popup" },
	{ title = "^(nmd|cliphist|pulsemixer|ranger|btop)$",                                                                                                                                                                                                                                                                                                                                                                                                                                     tag = "+cli-utils" }
}

for _, rule in ipairs(app_tags) do
	local match_tbl = {}
	if rule.class then match_tbl.class = rule.class end
	if rule.title then match_tbl.title = rule.title end
	if rule.content then match_tbl.content = rule.content end
	hl.window_rule({ match = match_tbl, tag = rule.tag })
end

-- Floating applications
hl.window_rule({ match = { class = "^(zoom|sxiv|Sxiv|[Vv]iewnior|feh|nm-connection-editor|install4j-burp-StartBurp|thorium-app.shortwave.com__-Default|thorium-mdpkiolbdkhdjpekfbkbmhigcaggjagi-Profile_1|thorium-lnachpgegbbmnnlgpokibfjlmppeciah-Default|BeeperTexts|electron|com.github.rafostar.Clapper|io.github.celluloid_player.Celluloid|qimgv)$" }, float = true })
hl.window_rule({ match = { title = "^(Steam Settings|Sign in – Google accounts)$" }, float = true })

-- Specific window pin/stay_focused rules
hl.window_rule({ match = { title = "^(zoom_linux_float_video_window)$" }, pin = true })
hl.window_rule({ match = { title = "(menu window)" }, stay_focused = true })
hl.window_rule({ match = { title = "^(btop)$" }, stay_focused = true })

hl.window_rule({ match = { tag = "gui-utils" }, animation = "slide right top" })

-- bitwarden chrome extension popup
hl.window_rule({
	match = { class = "^(thorium-nngceckbapebfimnlniiiahkandclblb-Default)$" },
	pin = true,
	float = true,
	stay_focused = true
})

-- firefox
hl.window_rule({ match = { title = "^Extension" }, float = true })

-- PIP sizing
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, size = { "(monitor_w*0.25)", "(monitor_h*0.25)" } })

hl.window_rule({ match = { tag = "time-sensitive" }, dim_around = true })
hl.window_rule({ match = { tag = "cli-utils" }, dim_around = true })

-- No shadow for tiled window
hl.window_rule({ match = { float = false }, no_shadow = true })

-- Opacity rules
local opacity_rules = {
	{ class = "^cursor-url-handler$",                  active = "0.85", inactive = "0.75" },
	{ title = "^Myass$",                               active = "0",    inactive = "0" },
	{ class = "^TelegramDesktop$",                     active = "1.00", inactive = "0.90" },
	{ class = "^spotify$",                             active = "0.90", inactive = "0.80" },
	{ class = "^Cider$",                               active = "0.90", inactive = "0.80" },
	{ class = "^Brave-browser$",                       active = "0.90", inactive = "0.80" },
	{ class = "^thunar$",                              active = "0.90", inactive = "0.80" },
	{ class = "^discord$",                             active = "0.85", inactive = "0.75" },
	{ class = "^Caja$",                                active = "0.90", inactive = "0.80" },
	{ class = "^polkit-gnome-authentication-agent-1$", active = "0.80", inactive = "0.70" },
	{ title = "^Open$",                                active = "0.80", inactive = "0.70" },
	{ title = "^New Tab - Thorium$",                   active = "0.8",  inactive = "0.5" }
}

for _, rule in ipairs(opacity_rules) do
	local match_tbl = {}
	if rule.class then match_tbl.class = rule.class end
	if rule.title then match_tbl.title = rule.title end
	hl.window_rule({ match = match_tbl, opacity = rule.active .. " " .. rule.inactive })
end

-- Full screen no idle
hl.window_rule({ match = { class = ".*" }, idle_inhibit = "fullscreen" })

-- no blurs
hl.window_rule({ match = { title = "^(Annotation - Zoom)$" }, no_blur = true })

-- Layer rules / blur
local layer_rules = {
	{ namespace = ".*",                           blur_popups = true },
	{ namespace = "^rofi$",                       blur = true,           ignore_alpha = 0, dim_around = true,        animation = "popin 45%" },
	{ namespace = "^quickshell::launcher.*$",     blur = true,           ignore_alpha = 0, dim_around = true,        animation = "popin 45%" },
	{ namespace = "^notifications$",              blur = true,           ignore_alpha = 0 },
	{ namespace = "^swaync-notification-window$", blur = true,           ignore_alpha = 0, animation = "slide right" },
	{ namespace = "^swaync-control-center$",      blur = true,           ignore_alpha = 0, animation = "slide right" },
	{ namespace = "^logout_dialog$",              blur = true },
	{ namespace = "^waybar$",                     blur = true,           ignore_alpha = 0 },
	{ namespace = "^quickshell::bar$",            blur = true,           ignore_alpha = 0 },
	{ namespace = "^quickshell::CC$",             blur = true,           ignore_alpha = 0, dim_around = true },
	{ namespace = "^syshud$",                     blur = true,           ignore_alpha = 0 },
	{ namespace = "^selection$",                  animation = "none" },
	{ namespace = "^mpvpaper$",                   animation = "gnome 0%" }
}

for _, rule in ipairs(layer_rules) do
	local params = { match = { namespace = rule.namespace } }
	for k, v in pairs(rule) do
		if k ~= "namespace" then params[k] = v end
	end
	hl.layer_rule(params)
end

-- Misc

-- xwaylandvideobridge
hl.window_rule({
	match = { class = "^(xwaylandvideobridge)$" },
	opacity = "0.0 override",
	no_anim = true,
	no_initial_focus = true,
	max_size = { "1", "1" },
	no_blur = true
})

-- Roblox join private server
hl.window_rule({ match = { class = "^(org.vinegarhq.Sober)$", title = "^(Join Friends)$" }, float = true })

-- No transparency for fullscreen windows
-- hl.window_rule({ match = { fullscreen = false }, ["plugin:chromakey"] = true })

-- suppressevent
hl.window_rule({ match = { class = "^spotify$" }, suppress_event = "activatefocus activate" })

-- Fix some dragging issues with XWayland
hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false
	},
	no_focus = true
})

-- Smart gaps overrides (commented out in original)
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
-- hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })
