--
-- ENVIRONMENT VARIABLES --
--

-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")

-- Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("__GL_GSYNC_ALLOWED", "1")
hl.env("VDPAU_DRIVER", "nvidia")
hl.env("NVD_BACKEND", "direct")
-- just in case if it tried to use igpu for hardware accel
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")

-- XDG
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
-- set by hyprland
-- hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- hl.env("XDG_SESSION_TYPE", "wayland")

-- QT & scale
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct:qt6ct")
-- hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("QT_ENABLE_HIGHDPI_SCALE", "1")
-- hl.env("QT_SCALE_FACTOR", "2")

-- java fix
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
-- hl.env("GDK_DPI_SCALE", "1.5")

-- Electron blurry etc fix
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- Input method
-- hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULES", "wayland;fcitx;ibus")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "fcitx")
hl.env("INPUT_METHOD", "fcitx")
hl.env("XMODIFIERS", "fcitx")
hl.env("IMSETTINGS_MODULE", "fcitx")

-- wine
hl.env("WINEPREFIX", "/opt/windows.wine")

-- howdy avoid spam from gstreamer
-- hl.env("OPENCV_LOG_LEVEL", "ERROR")

-- temp fix for gtk apps seg fault
-- hl.env("GSK_RENDERER", "ngl")

-- Toolkit backend
hl.env("GDK_BACKEND", "wayland, x11, *")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland, x11") -- Remove or set to x11 if games that provide older versions of SDL cause compatibility issues"

-- firefox
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- defaults
hl.env("BROWSER", "zen-browser")
hl.env("EDITOR", "hx")
hl.env("TERM", "kitty")
