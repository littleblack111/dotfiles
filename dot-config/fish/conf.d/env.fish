## 
## PATH & ENV Var
##

# PNPM, Qt/QML, Wine
set -x PNPM_HOME "$HOME/.local/share/pnpm"
set -x QML_IMPORT_PATH /usr/lib/qt6/qml
set -x WINEPREFIX /opt/windows.wine

# PATHs (Fish keeps PATH as a list; prepend/append with -xg to export globally)
# Preserve order as in your zsh config
set -xg PATH $PNPM_HOME $PATH
set -xg PATH $HOME/scripts $PATH
set -xg PATH $HOME/scripts/bin $PATH
set -xg PATH $PATH $HOME/.local/bin
set -xg PATH $HOME/.cargo/bin $PATH
set -xg PATH $PATH /snap/bin
set -xg PATH $PATH $HOME/.cache/.bun/bin
set -xg PATH $PATH $HOME/go/bin
set -xg PATH $PATH /home/system/.spicetify

# GPG_TTY and SUDO_PROMPT
# Fish: tty is a builtin; emulate ${TTY:-$(tty)}
if set -q TTY
    set -x GPG_TTY "$TTY"
else
    set -x GPG_TTY (tty)
end
set -x SUDO_PROMPT "pass: "

# Term/browser/editor
set -x TERMINAL kitty
set -x BROWSER zen-browser
set -x VISUAL hx
set -x EDITOR "$VISUAL"

# XDG base dirs
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CONFIG_DIRS /etc/xdg
set -x XDG_DATA_DIRS "/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
set -x XDG_DESKTOP_DIR "$HOME/Desktop"
set -x XDG_DOWNLOAD_DIR "$HOME/Downloads"
set -x XDG_TEMPLATES_DIR "$HOME/Templates"
set -x XDG_PUBLICSHARE_DIR "$HOME/Public"
set -x XDG_DOCUMENTS_DIR "$HOME/Documents"
set -x XDG_MUSIC_DIR "$HOME/Music"
set -x XDG_PICTURES_DIR "$HOME/Pictures"
set -x XDG_VIDEOS_DIR "$HOME/Videos"

# Pager/editor helpers
set -x MANPAGER 'nvim +Man! +"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'
set -x DIFFPROG 'nvim -d'
# set -x MANPAGER "lvim +Man"

# If using nvim as MANPAGER, optional LESS termcaps (kept commented as in your file)
# if test (echo $MANPAGER | awk '{print $1}') = nvim
#     set -x LESS "--RAW-CONTROL-CHARS"
#     # set -x MANPAGER "less -s -M +Gg"
#     set -x LESS_TERMCAP_mb \e'[1;32m'
#     set -x LESS_TERMCAP_md \e'[1;32m'
#     set -x LESS_TERMCAP_me \e'[0m'
#     set -x LESS_TERMCAP_se \e'[0m'
#     set -x LESS_TERMCAP_so \e'[01;33m'
#     set -x LESS_TERMCAP_ue \e'[0m'
#     set -x LESS_TERMCAP_us \e'[1;4;31m'
# end

# less source highlight
set -x LESSOPEN "| /usr/bin/source-highlight-esc.sh %s"
set -x LESS "-R "

# FZF bases (kept commented)
# set -x FZF_DEFAULT_OPTS "
#   --color fg:#cdd6f4
#   --color fg+:#cdd6f4
#   --color bg:#1e1e2e
#   --color bg+:#313244
#   --color hl:#f38ba8
#   --color hl+:#f38ba8
#   --color info:#cba6f7
#   --color prompt:#cba6f7
#   --color spinner:#f5e0dc
#   --color pointer:#f5e0dc
#   --color marker:#f5e0dc
#   --color border:#1e1e2e
#   --color header:#f38ba8
#   --prompt ' '
#   --pointer ' λ'
#   --layout=reverse
#   --border horizontal
#   --height 40
# "

# LS_COLORS (huge; intentionally kept commented as in your file)
# set -x LS_COLORS '...'

# set -x LANG "zh_CN.UTF-8"

# vim:ft=zsh:nowrap  (left as comment for fidelity)

# source $HOME/.config/zsh/env.local.zsh
# In Fish, source a Fish file instead if you have one:
# test -f $HOME/.config/fish/env.local.fish; and source $HOME/.config/fish/env.local.fish
