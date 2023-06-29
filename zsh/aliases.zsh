##
## Aliases
##

alias run='pnpm run'
alias c="clear"
alias q="exit"
alias cleanram="sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias trim_all="sudo fstrim -va"
alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mtar='tar -zcvf' # mtar <archive_compress>
alias utar='tar -zxvf' # utar <archive_decompress> <file_list>
alias z='zip -r' # z <archive_compress> <file_list>
alias uz='unzip' # uz <archive_decompress> -d <dir>
alias sr='source ~/.config/zsh/env.zsh'
alias ..="cd .."
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" 
alias mkdir="mkdir -p"
alias fm='ranger'
alias pacin="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias paruin="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -S"
alias pacrem="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
#alias pac="pacman -Q | fzf"
alias parucom="paru -Gc"
alias parupd="paru -Qua"
alias pacupd="pacman -Qu"
alias parucheck="paru -Gp"
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq); paru -c'
alias installed="grep -i installed /var/log/pacman.log"

# git & gh
#alias tree='tree -a -I .git'
#alias cat="bat --color always --plain"
alias grep='grep --color=auto'
alias mv='mv -v'
alias cp='cp -vr'
alias rm='rm -vr'
alias commit="git add . && git commit -m"
alias push="git push"
alias git-rm="git ls-files --deleted -z | xargs -0 git rm"
alias g=git
#alias ga='git add'
alias gaa='git add --all'
alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gamscp='git am --show-current-patch'
alias gap='git apply'
alias gapa='git add --patch'
alias gapt='git apply --3way'
alias gau='git add --update'
alias gav='git add --verbose'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
#alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gca='git commit -v -a'
alias 'gca!'='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias 'gcan!'='git commit -v -a --no-edit --amend'
alias 'gcans!'='git commit -v -a -s --no-edit --amend'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gcb='git checkout -b'
alias gcd='git checkout $(git_develop_branch)'
alias gcf='git config --list'
alias gclr='git clone --recurse-submodules'
alias gcl='git clone'
alias gcld='git clone --depth'
alias gclean='git clean -id'
alias gcm='git checkout $(git_main_branch)'
alias gcmsg='git commit -m'
alias 'gcn!'='git commit -v --no-edit --amend'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gcss='git commit -S -s'
alias gcssm='git commit -S -s -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdup='git diff @{upstream}'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune --jobs=10'
alias gfg='git ls-files | grep'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpur=ggu
alias ggpush='git push origin "$(git_current_branch)"'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
alias gk='\gitk --all --branches &!'
alias gke='\gitk --all $(git log -g --pretty=%h) &!'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias globurl='noglob urlglobber '
alias glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
alias glods='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --all'
alias glols='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --stat'
alias glp=_git_log_prettily
alias glum='git pull upstream $(git_main_branch)'
alias gm='git merge'
alias gma='git merge --abort'
alias gmom='git merge origin/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias 'gpf!'='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpr='git pull --rebase'
alias gpristine='git reset --hard && git clean -dffx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gpdb='git push origin --delete'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grwh='git rm --cached `git ls-files -i -c --exclude-from=.gitignore`'
alias grwhx='git ls-files -i -c --exclude-from=.gitignore | xargs git rm --cached'
alias grad='git rm -r --cached . && git add .'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbo='git rebase --onto'
alias grbom='git rebase origin/$(git_main_branch)'
alias grbs='git rebase --skip'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='gsta --include-untracked'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias gupv='git pull --rebase -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gcl='git clone --depth 1 --recurse-submodules'
alias gi='git init'
alias gl='git log'
#alias ga='git add'
alias gc='git commit -am'
alias gp='git push origin main'
alias gitp='git pull origin main'
alias gs='git status'
alias gitrm='git rm --cached -rf'
alias g='git'
alias gsb='git switch'
alias gcb='git checkout -b'
alias gu='ga && gc update && git push'
alias ghcl='gh repo clone' #-- --recurse-submodules'
alias ghdb='git push origin --delete'
alias ghcr='gh repo create'
alias ghpr='gh pr'
alias ghis='gh issue'


alias gpt='sgpt'
alias chat='gpt'
alias chatgpt='chat'
# chatgpt
#alias chatgpt='chatgpt-cli'

#alias ls="exa --color=auto --icons" # lsd same
#alias l="ls -l"
#alias la="ls -a"
#alias lla="ls -la"
#alias lt="ls --tree"
#alias tree='tree -a -I .git'
#alias cat="bat --color always --plain"


# better ls
if [ $DISPLAY ]; then
    alias ls='lsd'
else
    alias ls="exa --color=auto"
fi
alias l='ls -l'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lah='ls -lah'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'



# common alias
# restart terminal
alias rel='exec /bin/zsh'
alias reload='exec /bin/zsh'
alias news='exec /bin/zsh'
alias refresh='exec /bin/zsh'
alias fns='/usr/bin/clear; exec /bin/zsh'
alias fnews='/usr/bin/clear; exec /bin/zsh'
alias clear='/usr/bin/clear; neofetch | lolcat'
alias cls='clear'
# better vims
alias record='asciinema rec'
alias rec='asciinema rec'
# libreoffice
alias librewriter='libreoffice --writer'
alias librecalc='libreoffice --calc'
alias librebase='libreoffice --base'
alias libredraw='libreoffice --draw'
alias libreimpress='libreoffice --impress'
alias libremath='libreoffice --math'
# noouput programe
#alias nooutput='$1 > /dev/null 2>&1 &'
# wps test
alias wps='ttyper'
alias wps-cli='ttyper'
alias wps-test='ttyper'
# web2app
alias web2app='nativefier --name '
# alias vim='kak'
#alias vim='/home/system/scripts/vim'
#alias vim='lvim'
# copy/paste from terminal
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
# port forwarding & webserver
alias cloudflarepf='cloudflared tunnel --url localhost:'
alias portforward='cloudflared tunnel --url localhost:'
alias ngrokpf='ngrok http '
alias webserver='echo clearing background jobs; fg &> /dev/null; echo starting python webserver and making it go to background && sudo python3 -m http.server 80 & echo forwarding the python server with cloudflare and it might not sussess; cloudflared tunnel --url http://127.0.0.1:80; pulling out python server from background for quit; fg; fg&> /dev/null; fg&> /dev/null'
alias localwebserver='sudo python3 -m http.server 80'
# vpn(hide.me)
alias open-vpn='systemctl start hide.me@free-us.hideservers.net'
alias start-vpn='systemctl start hide.me@free-us.hideservers.net'
alias close-vpn='systemctl stop hide.me@free-us.hideservers.net	'
alias stop-vpn='systemctl stop hide.me@free-us.hideservers.net'
# open
alias open='xdg-open'
# image clear water mark
alias cwater-mark='lama-cleaner > /dev/null 2>&1 &'
# stablediffusion
alias aimage='cd /mnt/DATA/Code/AI/stable-diffusion-webui && ./webui.sh --use-cpu all --no-half; cd -'
alias stablediffusion='aimage'
# better python
alias python='bpython'
alias python3='bpython'
alias pipreqr='pip3 install -r requirements.txt'
alias pipreqsi='installpipreqs'
# better discord
#alias discord='discord-screenaudio'
# better wget
alias wget='aria2c'
# audios
alias audio='pulsemixer'
alias audiod='pipewire-pulse'
# alias audiod='pipewire*'
alias config-bspwm='vim ~/.config/bspwm/bspwmrc'
alias config-keybind='vim ~/.config/bspwm/sxhkdrc'
alias config-polybar='vim ~/.config/bspwm/themes/default/polybar/config.ini'
# better less/cat
alias less='bat' # moved into utility for auto sudo # nah, the one wont work with pipe
alias cat='bat --pager=never' # moved into utility for auto sudo # nah, wont work with pipe
# better diff
#alias diff='bat -d'
# tars
alias tarxz='tar -xvJf '
alias targz='tar -xvzf '
# faster(vim)
alias v='vim'
## auto fuck
# better finds
#alias find='sudo find / | grep '
#alias findhere='sudo find | grep '
# ip
alias pubip='curl ifconfig.co'
# map
alias map='mapscii'
# disk analyser
alias diskana='ncdu'
# must run as root commands
# alias pacman='sudo pacman'
alias sudo='sudo '
alias root='sudo su'
alias \*='sudo'
alias visudo='sudo visudo'
alias snap='sudo snap'
alias fucking='sudo'
alias howdy='sudo howdy'
alias gparted='sudo gparted'
alias gpart='sudo gpart'
alias gdisk='sudo gdisk'
alias cgdisk='sudo cgdisk'
alias cfdisk='sudo cfdisk'
alias fdisk='sudo fdisk'
alias blkid='sudo blkid'
alias systemctl='sudo systemctl'
alias service='systemctl'
alias mkinitcpio='sudo mkinitcpio'
alias bpytop='sudo bpytop'
alias debtap='sudo debtap'
alias rpm='sudo rpm'
alias journalctl='sudo journalctl'
alias upgrade-grub='grub-mkconfig -o /boot/grub/grub.cfg'
#alias update-grub='sudo update-grub'
alias grub-mkconfig='sudo grub-mkconfig'
alias update-initramfs='mkinitcpio -P'
alias kgupdate='update-initramfs && grub-mkconfig -o /boot/grub/grub.cfg'
alias locale-gen='sudo locale-gen'
alias ufw='sudo ufw'
alias swapon='sudo swapon'
alias swapoff='sudo swapoff'
alias grpck='sudo grpck'
alias pwck='sudo pwck'
#alias npm='sudo npm'
alias pacman-key='sudo pacman-key'
alias add-pacman-repository='sudo add-pacman-repository'
alias downgrade='sudo downgrade'
alias emerge='sudo emerge'
alias powerpill='sudo powerpill'
alias timeshift='sudo timeshift'
alias mount='sudo mount'
alias umount='sudo umount'
# user/group related command
alias usermod='sudo usermod'
alias useradd='sudo useradd'
alias userdel='sudo userdel'
alias pipes='pipes.sh'
# better cd
alias bcd='fzf'
# view keybinds
alias keybind='xev'
# bettercap
alias bettercap='sudo bettercap'
# better pacman
#alias pacman='paru'
alias pacman='yay '
#alias pacman='pamac'
#alias pacman='sudo pacman'
#alias apt='pamac' # idk there is a package called apt lmao
# full system upgrade/update
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias update='npm update & nix-env -u & brew update & yay -Sl > /tmp/yaySl & yay -Syuu --noconfirm --disable-download-timeout' # pipx upgrade-all
alias upgrade='update'
# more pacman alis
alias packagelistignoreall='paru --color always -Sl | sed -e "s: :/:; s/ unknown-version//; /已安装/d" | fzf --multi --ansi --preview "yay -Si {1}" | cut -d" " -f1 | xargs -ro yay -S'
alias packagelist='paru --color always -Sl | sed -e "s: :/:; /unknown-version/d" | fzf --multi --ansi --preview "yay -Si {1}" | cut -d" " -f1 | xargs -ro yay -S'
alias packagef="/usr/bin/cat /tmp/yaySl | cut -d' ' -f2 | fzf --multi --ansi --preview 'yay -Si {1}' | xargs -ro paru -S --skipreview --needed"
alias package='packagelist'
alias pi='pacman --noconfirm -S --needed'
#alias ps='pacman --noconfirm -S --needed'
alias pr='pacman --noconfirm -Rns'
alias pri='pacman --noconfirm -S'
alias pc='pacman -Scc'
alias clean='pacman -Scc'
alias pf='pacman --noconfirm '
alias p='pacman'
alias pd='downgrade'
# alias for nix(package manager)
#alias nix-install='nix-env -iA nixpkgs.'
alias nix-remove='nix-env -e'
# pipes.sh config
alias pipes.sh='pipes.sh -r 0'
# installrequirements(with pip)(from requirements.txt)
alias installrequirements='pip install -r requirements.txt'
# alias for python
alias py='python3'
# more humenize
alias df='df -h'
alias du='du -h'
#alias free='free -h'
alias grep='grep --color=always'

# vim:ft=zsh
# doesn't work in zshenv


# idk Y but it will say no correct
alias j='nocorrect j'
alias killall='nocorrect killall'
alias mysql='mysql'
#alias pi='nocorrect pi'
#alias pr='nocorrect pr'
#alias p='nocorrect p'
#alias pacman='nocorrect pacman'

alias sys='nu -c sys'
alias process='nu -c ps'

# compiles
alias compile-run='compile-run'
alias cmp='compile'
alias cmpr='compilerun'
# disasm
alias disasm='objdump -d'
alias discompile='objdump -d'
#alias mpv='mpv --no-audio-display --hwdec=vaapi' # my device...`[vaapi] libva: vaGetDriverNameByIndex() failed with unknown libva error, driver_name = (null)`
alias backup='rsync --archive --quiet --backup --partial --copy-links --cvs-exclude'
# sent text via ix
alias sendraw='ix'
alias sentext='ix'
# custom chat server
alias joinchat='nc 127.0.0.1 8000'
# license
alias license='/usr/bin/cat /mnt/DATA/Code/license.txt'
alias license.short="sed -n '2p' /mnt/DATA/Code/license.txt"
# browsh
alias browsh='echo "export $(env | grep --color=never LANG=)" > $HOME/.cache/browsh.LANGcache && LANG=EN && browsh && $(cat $HOME/.cache/browsh.LANGcache) && rm $HOME/.cache/browsh.LANGcache'
# metasploit framework
alias msfconsole='msfd && /usr/bin/msfconsole || echo [*] msfd faild to start'
# process related stuff
alias processfind='ps -aux | grep -v grep | grep'
alias processf='processfind'
alias pf='processfind'


# help
alias help='tldr'

