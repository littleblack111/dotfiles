# A general arch linux rice

#### DEMO
https://v.redd.it/yquu7egrndqd1

## Dependencies
##### Required
Hyprland
waybar
swaync
hypridle
hyprlock


# THE FOLLOWING SECTION DOES NOT WORK YET
### Arch Based system install package dependencies
##### pacman
```
sudo pacman -S --needed $(cat package.list)
```
##### aur
```
sudo yay -S --needed $(cat package.aur)
```
###### LUNARVIM INSTALL
this is the most updated version of writing this, the install script may have changed
```
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```
the script is at https://www.lunarvim.org/docs/installation

###### Full package list of system can be find of /pacman*

## Install
#### Automated Script (currently does not work yet)
`curl -fsSL https://github.com/littleblack111/dotfiles/raw/main/install.sh | zsh`

#### Manual Install
with git clone:
`git clone https://github.com/littleblack111/dotfiles.git`
with gh cli:
`gh repo clone littleblack111/dotfiles`
use stow to install the configs
`stow --dotfiles -v --ignore 'usr' --ignore 'boot' --ignore 'etc' --ignore 'pacmanQm' --ignore 'pacmanQ' --ignore 'pacmanQq' --ignore 'pacman -Qmq' --ignore 'package.list'`
install system files
`stow -v usr -t /usr`
`stow -v boot -t /boot`
`stow -v etc -t /etc`

#### specs
Terminal Emu: `Alacritty`\
Session Manager: `sddm`\
Windows manager/Compositor: `Hyprland`\
Text/Code editor: `lunarvim/vscode`\
Status Bar: `waybar`\
Launcher: `rofi`\
Notifications: `swaync`\
File Manager: `Thunar` 

#### Notes for system configs:
- `howdy` is used for sudo
    - install the `python-dlib-cuda(-git)` package for cuda support(faster) and enable `use_cnn`
        - check by `python -c "import dlib; print(dlib.DLIB_USE_CUDA)"`
- use `fcitx5` instead of `fcitx` for better support, `fcitx` is deprecated
