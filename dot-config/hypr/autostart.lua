hl.on("hyprland.start", function()
	--
	-- AUTOSTART --
	--

	-- Autostart necessary processes (like notifications daemons, status bars, etc.)
	-- Or execute your favorite apps at launch like this:

	-- FIX CURSOR because keep reseting(see: https://www.reddit.com/r/hyprland/comments/1fgfmqb/gtk_apps_not_respecting_cursor_theme/)
	-- hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic')
	-- hl.exec_cmd('hyprctl setcursor Bibata-Modern-Classic 24')

	-- Launch hyprland plugins
	hl.exec_cmd('hyprpm reload || hyprpm update')
	-- Start pyprland daemon
	-- hl.exec_cmd('pyprland')

	-- Waybar
	-- hl.exec_cmd('waybar')
	-- Quickshell
	hl.exec_cmd('qs -d')
	-- Hypr-Eco
	-- hl.exec_cmd('hyprpaper')
	-- hl.exec_cmd($'SCRIPTSDIR/hyprpaper.sh')
	hl.exec_cmd(vars.bgChangerBin)
	-- hl.exec_cmd($'SCRIPTSDIR/mpvpaper.sh')
	hl.exec_cmd('hypridle')

	hl.exec_cmd('hyprsunset')

	-- XWayland
	hl.exec_cmd('xrdb -merge ~/.Xresources')

	-- Auth agent
	-- hl.exec_cmd('systemctl --user start plasma-polkit-agent -- doesnt respect themeing')
	-- hl.exec_cmd(/'usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1')
	hl.exec_cmd('systemctl --user start hyprpolkitagent')
	-- keyring agent
	hl.exec_cmd('gnome-keyring-daemon --start --components=pkcs11,secrets,ssh')
	-- Location service
	hl.exec_cmd('/usr/lib/geoclue-2.0/demos/agent &')
	-- input method
	hl.exec_cmd('fcitx5 -d')
	-- app armor notifications
	hl.exec_cmd('aa-notify -p -s 1 -w 60 -f /var/log/audit/audit.log')

	-- Clipboard history
	-- hl.exec_cmd('wl-paste --watch cliphist store')
	hl.exec_cmd('wl-paste --type text --watch cliphist store')
	hl.exec_cmd('wl-paste --type image --watch cliphist store')
	-- hl.exec_cmd('clipsync')
	-- hl.exec_cmd('wl-clip-persist --clipboard regular')

	-- Notification agent
	hl.exec_cmd('while true; do swaync; done')

	-- window swicher daemon
	hl.exec_cmd('hyprswitch init --size-factor 5')

	-- audio auto adjust
	-- hl.exec_cmd($'HOME/scripts/audio-autoAdjust.sh --daemon')
	hl.exec_cmd('while true; do $HOME/.cargo/bin/audio-adjuster; done')

	-- effect for audio
	hl.exec_cmd('while true; do easyeffects --gapplication-service; done')

	-- startup sound
	hl.exec_cmd('$HOME/scripts/startupsound.sh')

	-- misc
	-- sys hud
	-- hl.exec_cmd('syshud -M audio_in,audio_out,brightness -b /sys/bus/ddcci/devices/ddcci13/backlight/ddcci13/')
	hl.exec_cmd('syshud')
	-- night light
	-- hl.exec_cmd('gammastep -l geoclue2')
	hl.exec_cmd('$HOME/scripts/hyprsunset.sh')
	hl.exec_cmd('systemd-inhibit --who="Hyprland" --why="Handling power key" --what=handle-power-key sleep infinity')

	-- user applications
	hl.exec_cmd('udiskie')
	hl.exec_cmd('bitwarden-desktop')
	-- hl.exec_cmd('kdeconnectd')
	-- hl.exec_cmd('killall input-leap input-leaps; input-leap -- works with https://github.com/3l0w/Hyprland/tree/feat/input-capture-impl')
	hl.exec_cmd('nextcloud --background')
	-- hl.exec_cmd(['noinitialfocus; workspace, special] localsend --hidden')
	-- hl.exec_cmd(['workspace 6 silent; noinitialfocus] discord --start-minimized')
	hl.exec_cmd('beeper $waylandarg --no-sandbox --hidden --default-frame --enable-wayland-ime')
	-- hl.exec_cmd('bash -c "echo 'ddcci 0x37' | sudo tee /sys/bus/i2c/devices/i2c-13/new_device"')

	-- Notify if stuff is already started
	hl.exec_cmd("warp-cli status | grep Connect && notify-send 'warp-vpn' 'connected'")
	hl.exec_cmd(
		"pactl get-source-mute @DEFAULT_SOURCE@ | grep 'Mute: yes' >/dev/null && notify-send 'microphone' 'muted'")
	hl.exec_cmd("modprobe uvcvideo || notify-send 'uvcvideo' 'disabled'")
	hl.exec_cmd("pgrep -f gpu-screen-recorder && notify-send 'recorder' 'recording'")

	-- restore session
	hl.exec_cmd('hyprsession')

	-- restore stuff like music etc
	hl.exec_cmd(vars.SCRIPTSDIR .. '/hypridle.sh --stopidle')

	-- spam of notification at start(e.g. chromium)
	hl.exec_cmd(
		'if [[ $(swaync-client --get-dnd) == "false" ]]; then swaync-client --dnd-on && sleep 3 && swaync-client --dnd-off; fi')
	-- thunar launch faster
	hl.exec_cmd('while true; do thunar --daemon; done')

	-- alacritty
	-- hl.exec_cmd('while true; do alacritty --daemon; done')

	-- ghostty
	-- hl.exec_cmd(['workspace, special] ghostty')

	-- backlight
	-- hl.exec_cmd('wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video9 -x yuv420p')
	hl.exec_cmd('while true; do hyperhdr; done')
	-- hl.exec_cmd('video-guard')

	hl.exec_cmd('while true; do ~/scripts/flipper-ac.py "$(nc -lp 4883)"; done')
	hl.exec_cmd('while true; do nc -lp 4884 -e "~/scripts/flipper-ac.py statusBool"; done')
end)
