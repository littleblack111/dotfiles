# pacman/yay helpers

abbr -a pacman-key "sudo pacman-key"
abbr -a add-pacman-repository "sudo add-pacman-repository"
abbr -a downgrade "sudo downgrade"
# better pacman
#abbr -a pacman "paru"
alias pacman "yay "
#abbr -a pacman "pamac"
#abbr -a pacman "sudo pacman"
#abbr -a apt "pamac" # idk there is a package called apt lmao

# full system upgrade/update
alias mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
# alias update 'sudo npm update -g & nix-env -u & brew upgrade & flatpak update -y & tldr -u & yay -Syu --noconfirm --disable-download-timeout' # pipx upgrade-all

# more pacman alis
alias packagelistignoreall 'paru --color always -Sl | sed -e "s: :/:; s/ unknown-version//; /已安装/d" | fzf --multi --ansi --preview "yay -Si {1}" | cut -d" " -f1 | xargs -ro yay -S'
alias package "paru --color always -Sl \
    | fzf --multi --ansi --preview 'yay -Si {2}' \
    | awk '{print \$2}' \
    | xargs -r yay -S --noconfirm"
# alias packagelist 'paru --color always -Sl | sed -e "s: :/:; /unknown-version/d" | fzf --multi --ansi --preview "yay -Si {1}" | cut -d" " -f1 | xargs -ro yay -S'
alias packagef "/usr/bin/cat /tmp/yaySl | cut -d' ' -f2 | fzf --multi --ansi --preview 'yay -Si {1}' | xargs -ro paru -S --skipreview --needed"
alias pi "pacman --noconfirm -S --needed"
alias pic "pacman --noconfirm -S --needed --ask 4"
alias pico "pacman --noconfirm -S --overwrite \"*\" --needed --ask 4"
alias picdep "pacman --noconfirm -Sd --needed --ask 4 --nodeps"
alias pidep "pacman --noconfirm -S --asdeps --needed"
alias pindep "pacman --noconfirm -Sd --nodeps"
alias pif "pacman --noconfirm --force -S --needed"
alias pifd "pacman -Sd --needed --nodeps"
alias pio "pacman --noconfirm -S --overwrite \"*\" --needed"
alias prio "pacman --noconfirm -S --overwrite \"*\""
alias priob "pacman --noconfirm -S --overwrite \"*\" --rebuild"
#alias ps "pacman --noconfirm -S --needed"
alias pr "pacman --noconfirm -Rns"
alias prndep "pacman --noconfirm -Rnsd --nodeps"
alias pri "pacman --noconfirm -S"
alias prib "pacman --noconfirm -S --rebuild"
abbr -a pc "pacman -Scc"
abbr -a clean "pacman -Scc"
abbr -a pf "pacman --noconfirm "
abbr -a p pacman
abbr -a autoremove 'pacman -Rcns (pacman -Qdtq)'
abbr -a pd downgrade
#abbr -a pi 'nocorrect pi'
#abbr -a pr 'nocorrect pr'
#abbr -a p 'nocorrect p'
#abbr -a pacman 'nocorrect pacman'

alias pacin 'pacman -Slq | fzf -m --preview \'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")\' | xargs -ro sudo pacman -S'
alias paruin 'paru -Slq | fzf -m --preview \'cat <(paru -Si {1}) <(paru -Fl {1} | awk "{print \$2}")\' | xargs -ro paru -S'
alias pacrem 'pacman -Qq | fzf --multi --preview \'pacman -Qi {1}\' | xargs -ro sudo pacman -Rns'
# alias pac 'pacman -Q | fzf'
alias parucom "paru -Gc"
alias parupd "paru -Qua"
alias pacupd "pacman -Qu"
alias parucheck "paru -Gp"
alias cleanpac 'sudo pacman -Rns (pacman -Qtdq); and paru -c'
alias installed "grep -i installed /var/log/pacman.log"
# alias pacman "sudo pacman"
