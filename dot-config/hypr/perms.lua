hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.permission("/usr/bin/grim", "screencopy", "allow")
hl.permission("/usr/bin/hyprlock", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")

hl.permission("/var/cache/hyprpm/system/dynamic-cursors/dynamic-cursors.so", "plugin", "allow")
hl.permission("/var/cache/hyprpm/system/hyprscroller/hyprscroller.so", "plugin", "allow")

-- Keyboards
hl.permission("^yubico-yubikey-otp\\+fido\\+ccid$", "keyboard", "allow")
hl.permission("^wooting-wooting-two-he-\\(arm\\)$", "keyboard", "allow")
hl.permission("^wooting-wooting-two-he-\\(arm\\)-system-control$", "keyboard", "allow")
hl.permission("^wooting-wooting-two-he-\\(arm\\)-consumer-control$", "keyboard", "allow")
hl.permission("^company--usb-device-$", "keyboard", "allow")
hl.permission("^company--usb-device--keyboard$", "keyboard", "allow")
hl.permission("^logitech-brio-consumer-control$", "keyboard", "allow")
hl.permission("^video-bus$", "keyboard", "allow")
hl.permission("^power-button$", "keyboard", "allow")
hl.permission("^power-button-1$", "keyboard", "allow")
hl.permission("^sleep-button$", "keyboard", "allow")
hl.permission("^hp-wmi-hotkeys$", "keyboard", "allow")
hl.permission("^hl-virtual-keyboard$", "keyboard", "allow")
hl.permission("^hl-virtual-keyboard-fcitx5$", "keyboard", "allow")

hl.permission("^company--usb-device--keyboard-1$", "keyboard", "allow")

hl.permission(".*", "keyboard", "ask")
