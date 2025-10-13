# pacman/yay helpers

abbr -a pacman-key "sudo pacman-key"
abbr -a add-pacman-repository "sudo add-pacman-repository"
abbr -a downgrade "sudo downgrade"
# better pacman
#abbr -a pacman "paru"
abbr -a pacman "yay "
#abbr -a pacman "pamac"
#abbr -a pacman "sudo pacman"
#abbr -a apt "pamac" # idk there is a package called apt lmao

# full system upgrade/update
abbr -a mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
abbr -a mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
abbr -a mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
abbr -a mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
# abbr -a update 'sudo npm update -g & nix-env -u & brew upgrade & flatpak update -y & tldr -u & yay -Syu --noconfirm --disable-download-timeout' # pipx upgrade-all

# more pacman alis
alias packagelistignoreall 'paru --color always -Sl | sed -e "s: :/:; s/ unknown-version//; /已安装/d" | fzf --multi --ansi --preview "yay -Si {1}" | cut -d" " -f1 | xargs -ro yay -S'
alias package "paru --color always -Sl \
    | fzf --multi --ansi --preview 'yay -Si {2}' \
    | awk '{print $2}' \
    | xargs -r yay -S --noconfirm"
# abbr -a packagelist 'paru --color always -Sl | sed -e "s: :/:; /unknown-version/d" | fzf --multi --ansi --preview "yay -Si {1}" | cut -d" " -f1 | xargs -ro yay -S'
alias packagef "/usr/bin/cat /tmp/yaySl | cut -d' ' -f2 | fzf --multi --ansi --preview 'yay -Si {1}' | xargs -ro paru -S --skipreview --needed"
abbr -a pi "pacman --noconfirm -S --needed"
abbr -a pic "pacman --noconfirm -S --needed --ask 4"
abbr -a pico "pacman --noconfirm -S --overwrite \"*\" --needed --ask 4"
abbr -a picdep "pacman --noconfirm -Sd --needed --ask 4 --nodeps"
abbr -a pidep "pacman --noconfirm -S --asdeps --needed"
abbr -a pindep "pacman --noconfirm -Sd --nodeps"
abbr -a pif "pacman --noconfirm --force -S --needed"
abbr -a pifd "pacman -Sd --needed --nodeps"
abbr -a pio "pacman --noconfirm -S --overwrite \"*\" --needed"
abbr -a prio "pacman --noconfirm -S --overwrite \"*\""
abbr -a priob "pacman --noconfirm -S --overwrite \"*\" --rebuild"
#abbr -a ps "pacman --noconfirm -S --needed"
abbr -a pr "pacman --noconfirm -Rns"
abbr -a prndep "pacman --noconfirm -Rnsd --nodeps"
abbr -a pri "pacman --noconfirm -S"
abbr -a prib "pacman --noconfirm -S --rebuild"
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

abbr -a pacin 'pacman -Slq | fzf -m --preview \'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")\' | xargs -ro sudo pacman -S'
abbr -a paruin 'paru -Slq | fzf -m --preview \'cat <(paru -Si {1}) <(paru -Fl {1} | awk "{print \$2}")\' | xargs -ro paru -S'
abbr -a pacrem 'pacman -Qq | fzf --multi --preview \'pacman -Qi {1}\' | xargs -ro sudo pacman -Rns'
# abbr -a pac 'pacman -Q | fzf'
abbr -a parucom "paru -Gc"
abbr -a parupd "paru -Qua"
abbr -a pacupd "pacman -Qu"
abbr -a parucheck "paru -Gp"
abbr -a cleanpac 'sudo pacman -Rns (pacman -Qtdq); and paru -c'
abbr -a installed "grep -i installed /var/log/pacman.log"
# abbr -a pacman "sudo pacman"
