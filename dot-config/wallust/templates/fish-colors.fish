# set -U wallpaper "{{wallpaper}}"

set -U background '{{background}}'
set -U foreground '{{foreground}}'
set -U cursor '{{cursor}}'

set -U color0 '{{color0}}'
set -U color1 '{{color1}}'
set -U color2 '{{color2}}'
set -U color3 '{{color3}}'
set -U color4 '{{color4}}'
set -U color5 '{{color5}}'
set -U color6 '{{color6}}'
set -U color7 '{{color7}}'
set -U color8 '{{color8}}'
set -U color9 '{{color9}}'
set -U color10 '{{color10}}'
set -U color11 '{{color11}}'
set -U color12 '{{color12}}'
set -U color13 '{{color13}}'
set -U color14 '{{color14}}'
set -U color15 '{{color15}}'

set fish_color_normal normal
set fish_color_command {{color3.strip}}
set fish_color_param {{color11.strip}}
set fish_color_redirection $fish_color_param
set fish_color_comment {{color2.strip}}
set fish_color_error ff0000
set fish_color_escape {{color1.strip}}
set fish_color_operator $fish_color_escape
set fish_color_end {{color1.strip}}
set fish_color_quote {{color2.strip}}
set fish_color_autosuggestion {{color8.strip}}
set fish_color_user {{color12.strip}}
set fish_color_host {{color4.strip}}
set fish_color_valid_path --underline
set fish_color_cwd {{color4.strip}}
set fish_color_cwd_root red
set fish_color_match --background=brblue
set fish_color_search_match bryellow --background=brblack
set fish_color_selection white --bold --background=brblack
set fish_color_cancel -r
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_completion {{color15.strip}} --background={{color0.strip}}
set fish_pager_color_description $fish_color_quote yellow
set fish_pager_color_progress {{color6.strip}} --background={{color0.strip}}
set fish_color_history_current --bold

# FZF colors
set -gx FZF_DEFAULT_OPTS "
    $FZF_DEFAULT_OPTS
    --color fg:7,bg:0,hl:1,fg+:232,bg+:1,hl+:255
    --color info:7,prompt:2,spinner:1,pointer:232,marker:1
"
