abbr -a cleanram "sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
abbr -a trim_all "sudo fstrim -va"
abbr -a mkgrub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
abbr -a nmap "sudo nmap"
# alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbr -a update-grub "sudo update-grub"
abbr -a mtar "tar -zcvf"
abbr -a utar "tar -zxvf"
# abbr -a z "zip -r"
# abbr -a uz unzip
# alias unzip='ouch d'
# alias compress='ouch c'
# alias zip='ouch c'
abbr -a zip "ouch c"
abbr -a compress zip
abbr -a sr "source ~/.config/zsh/env.zsh"
abbr -a .. "cd .."
abbr -a psg "ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir "mkdir -p"
abbr -a fm ranger

alias cat "bat --plain --pager=never"
# alias grep='grep --color=auto'
alias grep "rg --no-heading --with-filename --smart-case --hyperlink-format=kitty -F"
alias mv "mv -v"
alias cp "cp --reflink=auto -vr"
alias rm "trash -v"

abbr -a gpt sgpt
abbr -a chat gpt
abbr -a chatgpt chat
# chatgpt
#alias chatgpt='chatgpt-cli'

# alias ls="exa --color=auto --icons" # lsd same
#alias l="ls -l"
#alias la="ls -a"
#alias lla="ls -la"
#alias lt="ls --tree"
# alias cat="bat --color always --plain"

# better ls
if set -q DISPLAY
    alias ls "eza --color=auto --icons=always --hyperlink"
else
    alias ls "eza --color=auto"
end
abbr -a l "ls -l"
abbr -a ll "ls -l"
abbr -a la "ls -a"
abbr -a lla "ls -laa"
abbr -a lah "ls -laah"
abbr -a lm "ls -m"
abbr -a lr "ls -R"
abbr -a lg "ls -l --group-directories-first"

# common alias
# restart terminal
abbr -a rel "exec /bin/zsh"
abbr -a reload "exec /bin/zsh"
abbr -a news "exec /bin/zsh"
abbr -a refresh "exec /bin/zsh"
abbr -a cls clear
# better vims
abbr -a record "asciinema rec"
abbr -a rec "asciinema rec"
# libreoffice
abbr -a librewriter "libreoffice --writer"
abbr -a librecalc "libreoffice --calc"
abbr -a librebase "libreoffice --base"
abbr -a libredraw "libreoffice --draw"
abbr -a libreimpress "libreoffice --impress"
abbr -a libremath "libreoffice --math"
# noouput programe
#alias nooutput='$1 > /dev/null 2>&1 &'
# wps test
abbr -a wps ttyper
abbr -a wps-cli ttyper
abbr -a wps-test ttyper
# web2app
abbr -a web2app "nativefier --name "
# alias vim='kak'
#alias vim='/home/system/scripts/vim'
#alias vim='lvim'
# copy/paste from terminal
alias copy wl-copy
alias paste wl-paste
# port forwarding & webserver
abbr -a cloudflarepf "cloudflared tunnel --url localhost:"
abbr -a portforward "cloudflared tunnel --url localhost:"
abbr -a ngrokpf "ngrok http "
function webserver
    echo clearing background jobs
    fg &>/dev/null
    echo starting python webserver and making it go to background
    sudo python3 -m http.server 80 &
    echo forwarding the python server with cloudflare and it might not sussess
    cloudflared tunnel --url http://127.0.0.1:80
    echo pulling out python server from background for quit
    fg
    fg &>/dev/null
    fg &>/dev/null
end
abbr -a localwebserver "sudo python3 -m http.server 80"
# vpn(hide.me)
abbr -a open-vpn "systemctl start hide.me@free-us.hideservers.net"
abbr -a start-vpn "systemctl start hide.me@free-us.hideservers.net"
abbr -a close-vpn "systemctl stop hide.me@free-us.hideservers.net"
abbr -a stop-vpn "systemctl stop hide.me@free-us.hideservers.net"
# open
abbr -a open xdg-open
# image clear water mark
abbr -a cwater-mark "lama-cleaner > /dev/null 2>&1 &"
# stablediffusion
function aimage
    cd /mnt/DATA/Code/AI/stable-diffusion-webui
    ./webui.sh --use-cpu all --no-half
    cd -
end
abbr -a stablediffusion aimage
# better python
abbr -a python bpython
abbr -a python3 bpython
abbr -a pip "python -m pip"
abbr -a pipreqr "pip3 install -r requirements.txt"
abbr -a pipreqsi installpipreqs
# better discord
#alias discord='discord-screenaudio'
# better wget
abbr -a wget "aria2c -x 16"
# audios
abbr -a audio pulsemixer
abbr -a audiod pipewire-pulse
# alias audiod='pipewire*'
abbr -a config-bspwm "vim ~/.config/bspwm/bspwmrc"
abbr -a config-keybind "vim ~/.config/bspwm/sxhkdrc"
abbr -a config-polybar "vim ~/.config/bspwm/themes/default/polybar/config.ini"
# better less/cat
# alias less='bat --pager=always --color always --plain' # moved into utility for auto sudo # nah, the one wont work with pipe
# alias cat='bat --pager=never' # moved into utility for auto sudo # nah, wont work with pipe
# better diff
#alias diff='bat -d'
# tars
abbr -a tarxz "tar -xvJf"
abbr -a targz "tar -xvzf"
# faster(vim)
abbr -a v hx
## auto fuck
# better finds
#alias find='sudo find / | grep '
#alias findhere='sudo find | grep '
# ip
abbr -a pubip "curl ifconfig.co"
# port
abbr -a getport "lsof -i"
# map
abbr -a map mapscii
# disk analyser
abbr -a diskana ncdu
# must run as root commands
abbr -a root "/usr/bin/sudo -i"
abbr -a "*" sudo
abbr -a visudo "sudo visudo"
abbr -a snap "sudo snap"
abbr -a fucking sudo
abbr -a howdy "sudo howdy"
abbr -a gparted "sudo -E gparted"
abbr -a gpart "sudo gpart"
abbr -a gdisk "sudo gdisk"
abbr -a cgdisk "sudo cgdisk"
abbr -a cfdisk "sudo cfdisk"
abbr -a fdisk "sudo fdisk"
abbr -a blkid "sudo blkid"
abbr -a service systemctl
abbr -a mkinitcpio "sudo mkinitcpio"
abbr -a bpytop "sudo bpytop"
abbr -a debtap "sudo debtap"
abbr -a rpm "sudo rpm"
abbr -a journalctl "sudo journalctl"
abbr -a powertop "sudo powertop"
abbr -a upgrade-grub "grub-mkconfig -o /boot/grub/grub.cfg"
#alias update-grub='sudo update-grub'
abbr -a grub-mkconfig "sudo grub-mkconfig"
abbr -a update-initramfs "mkinitcpio -P"
abbr -a kgupdate "update-initramfs && grub-mkconfig -o /boot/grub/grub.cfg"
abbr -a locale-gen "sudo locale-gen"
abbr -a ufw "sudo ufw"
abbr -a swapon "sudo swapon"
abbr -a swapoff "sudo swapoff"
abbr -a grpck "sudo grpck"
abbr -a pwck "sudo pwck"
#alias npm='sudo npm'
abbr -a npm bun
abbr -a npx bunx
abbr -a powerpill "sudo powerpill"
abbr -a timeshift "sudo timeshift"
abbr -a mount "sudo mount"
abbr -a umount "sudo umount"
# user/group related command
abbr -a usermod "sudo usermod"
abbr -a useradd "sudo useradd"
abbr -a userdel "sudo userdel"
abbr -a pacdiff "sudo -E pacdiff"
# change perms
abbr -a chown "chown -v"
abbr -a getown "sudo chown -R $USER:$USER"
abbr -a getread "sudo chmod +r"
abbr -a geturead "sudo chmod u+r"
abbr -a getgread "sudo chmod g+r"
abbr -a getexec "sudo chmod +x"
abbr -a getuexec "sudo chmod u+x"
abbr -a getgexec "sudo chmod g+x"
abbr -a getwrite "sudo chmod +w"
abbr -a getuwrite "sudo chmod u+w"
abbr -a getgwrite "sudo chmod g+w"
abbr -a pipes "pipes.sh"
# better cd
abbr -a bcd fzf
# view keybinds
abbr -a keybind xev
# bettercap
abbr -a bettercap "sudo bettercap"
abbr -a update "topgrade -y --no-retry"
abbr -a upgrade update
# alias for nix(package manager)
#alias nix-install='nix-env -iA nixpkgs.'
abbr -a nix-remove "nix-env -e"
# pipes.sh config
abbr -a pipes.sh "pipes.sh -r 0"
# installrequirements(with pip)(from requirements.txt)
abbr -a installrequirements "pip install -r requirements.txt"
# alias for python
abbr -a py python3
# more humenize
abbr -a df "df -h"
abbr -a du "du -h"
#alias free='free -h'
# alias grep='grep --color=always'
abbr -a frep "grep -ir"

# vim:ft=zsh
# doesn't work in zshenv

# alias sys='nu -c sys'
abbr -a usys "systemctl --user"
abbr -a sysu "systemctl --user"
abbr -a sys systemctl
abbr -a process "nu -c ps"

# compiles
abbr -a compile-run compile-run
abbr -a cmp compile
abbr -a cmpr compilerun
# disasm
abbr -a disasm "objdump -d"
abbr -a discompile "objdump -d"
#alias mpv='mpv --no-audio-display --hwdec=vaapi'
abbr -a backup "rsync --archive --quiet --backup --partial --copy-links --cvs-exclude"
# sent text via ix
abbr -a sendraw ix
abbr -a sentext ix
# custom chat server
abbr -a joinchat "nc 127.0.0.1 8000"
# license
abbr -a license "/usr/bin/cat /mnt/DATA/Code/license.txt"
# alias license.short="sed -n '2p' /mnt/DATA/Code/license.txt"
function license.short
    sed -n '634,648p' /mnt/DATA/Code/license.txt
end
# browsh
function browsh
    echo "export "(env | grep --color=never LANG=)"" >$HOME/.cache/browsh.LANGcache
    set LANG EN
    command browsh
    eval (cat $HOME/.cache/browsh.LANGcache)
    rm $HOME/.cache/browsh.LANGcache
end
# metasploit framework
function msfconsole
    msfd; and /usr/bin/msfconsole; or echo "[*] msfd faild to start"
end
# process related stuff
abbr -a processfind "ps -aux | grep -v grep | grep"
abbr -a processf processfind
abbr -a pf processfind

# alias code='cursor'

# help
abbr -a help tldr

abbr -a mt memento-timeline

# xdg-ninja suggested
abbr -a svn 'svn --config-dir $XDG_CONFIG_HOME/subversion'

# server stuff
function getfs
    scp -P 2002 -R ssh.littleblack111.com:$argv .
end
function putfile
    scp -P 2002 -R $argv ssh.littleblack111.com:~
end
function putfs
    scp -P 2002 -R $argv ssh.littleblack111.com:~/server/public-fs
end

# colors
# alias ping='prettyping'
# alias make='colormake'

# video screen cast using v4l2
abbr -a camscreen "wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video9 -x yuv420p"
abbr -a screencam "wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video9 -x yuv420p"
abbr -a camerascreen "wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video9 -x yuv420p"
abbr -a screencamera "wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video9 -x yuv420p"
abbr -a image-clean "iopaint start --host 0.0.0.0 --enable-anime-seg --enable-realesrgan --realesrgan-device cuda --enable-restoreformer --restoreformer-device cuda --enable-gfpgan --gfpgan-device cuda --disable-nsfw-checker --inbrowser --model-dir \$XDG_DATA_HOME/AI/IOPaint/modules"

# hyprland overlay
abbr -a hyproverlay "hyprctl keyword debug:overlay true"
abbr -a dhyproverlay "hyprctl keyword debug:overlay false"
abbr -a hyproverlayd "hyprctl keyword debug:overlay false"

abbr -a cavabg "alacritty --class winwrap -e cava"
abbr -a bgcava "alacritty --class winwrap -e cava"

# cpu freq
abbr -a cpuperf "sudo cpupower frequency-set -g performance"
abbr -a cpups "sudo cpupower frequency-set -g powersave"

# better time benchmark
abbr -a time "hyperfine --warmup 3 -N"

function '??'
    set file (mktemp)
    gh copilot suggest -t shell $argv --shell-out $file
    eval (cat $file)
    rm $file
end

abbr -a icat "kitten icat"

# abbr -a cd z

abbr -a md mkdir
