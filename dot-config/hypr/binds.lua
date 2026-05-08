hl.config({
	binds = {
		--      allow_workspace_cycles = yes
		-- movefocus_cycles_fullscreen = true
		allow_pin_fullscreen = true,
		scroll_event_delay = 0,
	},

})

-- See https://wiki.hyprland.org/Configuring/Keywords/
local mod = "SUPER" -- Sets "SUPER" key as main modifier

-- Launching...
hl.bind(mod .. " + return", hl.dsp.exec_cmd(vars.termLaunch))
hl.bind(mod .. " + SHIFT + return", hl.dsp.exec_cmd(vars.termfloat))
-- bind = mod space, return, execr, $terminal start --class pseudo
hl.bind(mod .. " + ALT + Delete", hl.dsp.exec_cmd(vars.rofiexec .. "/rofi_powermenu"))
hl.bind("ALT + F1", hl.dsp.exec_cmd("qs ipc call launcher toggle"))
hl.bind("ALT + F2", hl.dsp.exec_cmd(vars.rofiexec .. "/rofi_runner"))
hl.bind("ALT + F4", hl.dsp.exec_cmd(vars.rofiexec .. "/sgpt"))
-- bind = mod, period, execr, $rofiexec/rofi_emoji
hl.bind(mod .. " + period", hl.dsp.exec_cmd("qs ipc call launcher standalone Emoji"))
-- utils
hl.bind(mod .. " + C", hl.dsp.exec_cmd(vars.rofiexec .. "/rofi_configs"))
-- bind = mod, m, execr, $rofiexec/rofi_music
hl.bind(mod .. " + N", hl.dsp.exec_cmd("nmd"))
-- bind = mod, r, execr, $rofiexec/rofi_asroot
-- bind = mod, s, execr, $rofiexec/rofi_screenshot
-- bind = mod, v, execr, $rofiexec/rofi_clipboard
hl.bind(mod .. " + V", hl.dsp.exec_cmd("qs ipc call launcher standalone Clip"))
-- bind = mod, w, execr, $rofiexec/rofi_windows
-- bind = mod, x, execr, $rofiexec/rofi_powermenu
-- bind = mod, b, execr, $rofiexec/rofi_bluetooth
-- GUI
hl.bind(mod .. " + SHIFT + F", hl.dsp.exec_cmd(vars.fileManager))
-- bind = mod shift, w, execr, $browser --restore-last-session
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd(vars.browser .. " -new-tab about:sessionrestore"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("zeditor"))
hl.bind(mod .. " + SHIFT + D", hl.dsp.exec_cmd("discord " .. vars.waylandarg))
hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("beeper " .. vars.waylandarg))
-- CLI
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd(vars.termfloat .. " --title=pulsemixer -e pulsemixer"))
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd(vars.termfloat .. " --title=ranger -e ranger"))
hl.bind("CTRL + ALT + V", hl.dsp.exec_cmd(vars.termfloat .. " -e " .. vars.editor))

-- Emergency
hl.bind("CTRL + ALT + B", hl.dsp.exec_cmd(vars.termfloat .. " --title=btop -e sudo nice -n -20 ionice -c 1 sudo btop"),
	{ transparent = true, bypass = true })
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("$HOME/scripts/hyprshutdown.sh"), { transparent = true, bypass = true })
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("missioncenter"), { transparent = true, bypass = true })

-- Misc
-- bind = ctrl alt, m, execr, music
hl.bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker --autocopy"))
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("loginctl lock-session"), { transparent = true, bypass = true })
-- Misc
hl.bind(mod .. " + SHIFT + G", hl.dsp.exec_cmd("gtk-launch shortwave.desktop"))
-- bind = mod shift, c, execr, gtk-launch google-chat.desktop

-- XF86 keys & Misc
-- hl.bind("XF86Print", hl.dsp.exec_cmd("pidof slurp || $HOME/scripts/sysutil.sh screenshot --now"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("$HOME/scripts/sysutil.sh screenshot --area"))

-- Volume
hl.bind("XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		"wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 & wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && pw-play /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"),
	{ repeating = true })
hl.bind("XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		"wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 & wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && pw-play /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"),
	{ repeating = true })
hl.bind("XF86AudioMute",
	hl.dsp.exec_cmd(
		"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && pw-play /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl position 5+"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl -p spotify next"), { long_press = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl position 5-"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl -p spotify previous"), { long_press = true })
hl.bind("XF86AudioPlay",
	hl.dsp.exec_cmd(
		"[workspace 7 silent; noinitialfocus] playerctl -p spotify play-pause || LD_PRELOAD=/usr/lib/spotify-adblock.so spotify"),
	{ locked = true })
-- bindl = ,XF86AudioPlay, exec, [workspace 7 silent; noinitialfocus] playerctl -p chromium play-pause || /opt/Aonsoku/aonsoku
hl.bind("XF86AudioPlay",
	hl.dsp.exec_cmd(
		"[workspace 7 silent; noinitialfocus] playerctl --all-players pause || LD_PRELOAD=/usr/lib/spotify-adblock.so spotify"),
	{ locked = true, long_press = true })
-- bindol = ,XF86AudioPlay, exec, [workspace 7 silent; noinitialfocus] playerctl --all-players pause || /opt/Aonsoku/aonsoku
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl -p spotify stop"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("$HOME/scripts/hyprshutdown.sh"))

-- Pause
hl.bind(mod .. " + Pause", hl.dsp.exec_cmd("hyprfreeze -s -a"))

-- Print
hl.bind("Print", hl.dsp.exec_cmd("$HOME/scripts/hyprshot --now"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("$HOME/scripts/sysutil.sh brightness --inc"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("$HOME/scripts/sysutil.sh brightness --dec"), { repeating = true })
-- binde = ,XF86MonBrightnessUp, execr, hyprctl hyprsunset gamma +5
-- binde = ,XF86MonBrightnessDown, execr, hyprctl hyprsunset gamma -5

-- Window management
hl.bind(mod .. " + D", hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
hl.bind(mod .. " + I", hl.dsp.workspace.toggle_special("minimized"))
hl.bind(mod .. " + I", hl.dsp.window.move({ workspace = "+0" }))
hl.bind(mod .. " + Q", hl.dsp.window.close(), { repeating = true })
hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.close({ force = true }))
hl.bind("CTRL + ALT + Escape", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("CTRL + " .. mod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- restart bar
hl.bind("CTRL + " .. mod .. " + Escape", hl.dsp.exec_cmd("qs ipc call qs reload false || qs &"))

-- reload wall
hl.bind(mod .. " + ALT + B",
	hl.dsp.exec_cmd("killall wallust " .. vars.bgChangerBin .. " " .. vars.bgChanger .. "; " .. vars.bgChangerBin))
-- hl.bind("CTRL + " .. mod .. " + ALT + up", hl.dsp.scroller("jump"))

-- hyprswitch
hl.bind("ALT + Tab",
	hl.dsp.exec_cmd(
		"hyprswitch gui --mod-key alt_l --key tab --close mod-key-release --reverse-key=key=grave && hyprswitch dispatch"))
hl.bind("ALT + grave",
	hl.dsp.exec_cmd(
		"hyprswitch gui --mod-key alt_l --key tab --close mod-key-release --reverse-key=key=grave && hyprswitch dispatch -r"))

hl.bind("CTRL + ALT + left", hl.dsp.focus({ workspace = "-1" }), { repeating = true })
hl.bind("CTRL + ALT + right", hl.dsp.focus({ workspace = "+1" }), { repeating = true })
hl.bind(mod .. " + SHIFT + H", hl.dsp.layout("swapcol l"), { repeating = true })
hl.bind(mod .. " + SHIFT + L", hl.dsp.layout("swapcol r"), { repeating = true })
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }), { repeating = true })
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }), { repeating = true })

hl.bind("CTRL + " .. mod .. " + ALT + space", hl.dsp.layout("fit active"), { repeating = true })

hl.bind("CTRL + " .. mod .. " + SHIFT + H", hl.dsp.layout("colresize -conf"), { repeating = true })
hl.bind("CTRL + " .. mod .. " + SHIFT + L", hl.dsp.layout("colresize +conf"), { repeating = true })

-- fixme
-- hl.bind("CTRL + " .. mod .. " + SHIFT + J", hl.dsp.window.resize({ x = "0%", y = "50%", relative = true }),
-- 	{ repeating = true })
-- hl.bind("CTRL + " .. mod .. " + SHIFT + K", hl.dsp.window.resize({ x = "0%", y = "-50%", relative = true }),
-- 	{ repeating = true })

-- hl.bind(mod .. " + CTRL + H", hl.dsp.group.move_into_or_create({ direction = "l" }), { repeating = true })
-- hl.bind(mod .. " + CTRL + L", hl.dsp.group.move_into_or_create({ direction = "r" }), { repeating = true })
-- hl.bind(mod .. " + ALT + H", hl.dsp.group.move_out({ direction = "r" }), { repeating = true })
-- hl.bind(mod .. " + ALT + L", hl.dsp.group.move_out({ direction = "l" }), { repeating = true })

-- zoom
local function update_zoom(multiplier)
	local current_zoom = hl.get_config("cursor.zoom_factor")
	local new_zoom = current_zoom * multiplier
	if new_zoom < 1.0 then
		new_zoom = 1.0
	end
	hl.config({
		cursor = {
			zoom_factor = new_zoom
		}
	})
end

local function reset_zoom()
	hl.config({
		cursor = {
			zoom_factor = 1.0
		}
	})
end

hl.bind("SUPER + mouse_down", function() update_zoom(1.1) end)
hl.bind("SUPER + mouse_up", function() update_zoom(0.9) end)

hl.bind("SUPER + equal", function() update_zoom(1.1) end, { repeating = true })
hl.bind("SUPER + minus", function() update_zoom(0.9) end, { repeating = true })

hl.bind("SUPER + SHIFT + minus", reset_zoom)
hl.bind("SUPER + SHIFT + equal", reset_zoom)
hl.bind("SUPER + SHIFT + mouse_down", reset_zoom)
hl.bind("SUPER + SHIFT + mouse_up", reset_zoom)
-- spotify lyrics ig
-- bind = mod shift, u, execr, $SCRIPTSDIR/togglespot.sh

-- window shortcuts
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind("CTRL + ALT + F", hl.dsp.window.fullscreen({ state = 1 }))
hl.bind(mod .. " + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + space", hl.dsp.window.pseudo())   -- dwindle
hl.bind(mod .. " + SHIFT + M", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mod .. " + S", hl.dsp.window.pin())

-- Move focus with mainMod + arrow keys
hl.bind("CTRL + " .. mod .. " + K", hl.dsp.focus({ window = "floating" }))
hl.bind("CTRL + " .. mod .. " + J", hl.dsp.focus({ window = "tiled" }))
-- Move focus with mainMod + arrow keys / vim binds
local focus_dirs = { h = "l", l = "r", k = "u", j = "d" }
for k, v in pairs(focus_dirs) do
	hl.bind(mod .. " + " .. string.upper(k), hl.dsp.focus({ direction = v }), { repeating = true })
end

hl.bind("CTRL + " .. mod .. " + K", hl.dsp.focus({ window = "floating" }))
hl.bind("CTRL + " .. mod .. " + J", hl.dsp.focus({ window = "tiled" }))

-- Switch workspaces and move active window to a workspace with mod + [0-9]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = (i == 10) and true or nil }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Autoclicker binds
local autoclickers = {
	{ bind = "mouse:276", name = "left",  args = "" },
	{ bind = "mouse:275", name = "right", args = " right" }
}

for _, ac in ipairs(autoclickers) do
	hl.bind(ac.bind,
		hl.dsp.exec_cmd("exec -a autoclicker-" ..
			ac.name .. " zsh -c 'while true; do wlrctl pointer click" .. ac.args .. "; sleep $((0.$RANDOM/10)); done'"),
		{ ignore_mods = true })
	hl.bind(ac.bind, hl.dsp.exec_cmd("kill $(pgrep -f autoclicker-" .. ac.name .. ")"),
		{ ignore_mods = true, release = true })
end
