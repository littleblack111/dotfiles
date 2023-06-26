# A general arch linux rice

// add image or gif or mp4 about it.

## Install
#### Automated Script
`curl -fsSL https://github.com/littleblack111/dotfiles/raw/main/install.sh | sh `

#### Manual Install
with git clone:
`git clone https://github.com/littleblack111/dotfiles.git`
with gh cli:
`gh repo clone littleblack111/dotfiles`
copy the files into your config
`cp -vri dotfiles/* ~/.config/*`

#### specs
Terminal Emu: `Alacritty`\
Session Manager: `sddm`
Windows manager: `bspwm`
Compositor: `udev's picom & FT-labs picom merged`(https://github.com/littleblack111/picom-fdev-ft-labs-merge)
Text/Code editor: `neovim`
Status Bar: `Polybar`
Launcher: `rofi`
Notifications: `Dunstify`
File Manager: `Thunar`
