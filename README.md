# A general arch linux rice

![Screenshot_2023-06-26-17-50-58_1920x1080](https://github.com/littleblack111/dotfiles/assets/97672521/72b8bbf4-6658-407f-8225-d47d3e290d2a)

## Dependencies
##### Required
bspwm
picom
sddm
git/gh cli
##### Optional
rofi-file-browser-extended-git
bat
linuxbrew

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
Session Manager: `sddm`\
Windows manager: `bspwm`\
Compositor: `udev's picom & FT-labs picom merged`(https://github.com/littleblack111/picom-fdev-ft-labs-merge) \
Text/Code editor: `neovim`\
Status Bar: `Polybar`\
Launcher: `rofi`\
Notifications: `Dunstify`\
File Manager: `Thunar` 

## WARNING, SOME CONFIGS ARE FROM ARCHCRAFT
