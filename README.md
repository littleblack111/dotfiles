# A general arch linux rice

![Screenshot_2023-06-26-17-50-58_1920x1080](https://github.com/littleblack111/dotfiles/assets/97672521/72b8bbf4-6658-407f-8225-d47d3e290d2a)

## Dependencies
##### Required
bspwm
picom
sddm

### Arch Based system install package dependencies
##### main repo
```
sudo pacman -S --needed bspwm alacritty zsh polybar rofi neovim fastfetch glava dunst python python3 python-pip thunar dconf fastfetch xdg-desktop-portal vkbasalt ttf-font-awesome ttf-roboto ttf-roboto-mono ttf-iosevka ttf-mac-fonts unicode upd72020x-fw mpd-mpris gtk2 gtk3 gtk4 gtk qt6-base qt5-base qt6-tools ffmpegthumbnailer timeshift snap-pac lxappearance-gtk3 lxappearance-gtk2 lxappearance-obconf lxappearance-obconf-gtk3 lxappearance-obconf-gtk2 lxappearance-obconf-gtk lxappearance-obconf-gtk4 lxappearance-obconf-gtk5 lxappearance-obconf-gtk6 lxappearance-obconf-gtk7 lxappearance-obconf-gtk8 lxappearance-obconf-gtk9 lxappearance-obconf-gtk10 lxappearance-obconf-gtk11 lxappearance-obconf-gtk12 lxappearance-obconf-gtk13 lxappearance-obconf-gtk14 lxappearance-obconf-gtk15 lxappearance-obconf-gtk16 lxappearance-obconf-gtk17 lxappearance-obconf-gtk18 lxappearance-obconf-gtk19 lxappearance-obconf-gtk20 lxappearance-obconf-gtk21 lxappearance-obconf-gtk22 lxappearance-obconf-gtk23 lxappearance-obconf-gtk24 lxappearance-obconf-gtk25 lxappearance-obconf-gtk26 lxappearance-obconf-gtk27 lxappearance-obconf-gtk28 lxappearance-obconf-gtk29 lxappearance-obconf-gtk30 lxappearance-obconf-gtk31 lxappearance-obconf-gtk32 lxappearance-obconf-gtk33 lxappearance-obconf-gtk34 lxappearance-obconf-gtk35 lxappearance-obconf-gtk36 lxappearance-obconf-gtk37 lxappearance-obconf-gtk38 lxappearance-obconf-gtk39 lxappearance-obconf-gtk40 lxappearance-obconf-gtk41 lxappearance-obconf-gtk42 lxappearance-obconf-gtk43 lxappearance-obconf-gtk44 lxappearance-obconf-gtk45 lxappearance-obconf-gtk46 lxappearance-obconf-gtk47 lxappearance-obconf-gtk48 lxappearance-obconf-gtk49 lxappearance-obconf-gtk50 lxappearance-obconf-gtk51 lxappearance-obconf-gtk52 lxappearance-obconf-gtk53 lxappearance-obconf-gtk54 lxappearance-obconf-gtk55 lxappearance-obconf-gtk56 lxappearance-obconf-gtk57 lxappearance-obconf-gtk58 lxappearance-obconf-gtk59 lxappearance-obconf-gtk60 lxappearance-obconf-gtk61 lxappearance-obconf-gtk62 lxappearance-obconf-gtk63 lxappearance-obconf-gtk64 lxappearance-obconf-gtk65 lxappearance-obconf-gtk66 lxappearance-obconf-gtk67 lxappearance nwg-look
```
##### aur
```
sudo yay -S --needed picom-ft-udev spotify-adblock spicetify-cli update-grub rofi-file-browser-extended-git reshade-shaders-git otf-apple-fonts btrfs-assistant snapper snapper btrfsmaintenance gtk
```
### LUNARVIM INSTALL
this is the most updated version of writing this, the install script may have changed
```
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```
the script is at https://www.lunarvim.org/docs/installation


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
Text/Code editor: `lunarvim`\
Status Bar: `Polybar`\
Launcher: `rofi`\
Notifications: `Dunstify`\
File Manager: `Thunar` 

## WARNING, SOME CONFIGS ARE FROM ARCHCRAFT
