# Fig pre block. Keep at the top of this file.
#[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# .zshrc

if [[ $TERM != "xterm-256color" ]] && [[ $TERM_PROGRAM != "vscode" ]]; then
    #neofetch | lolcat
    #archey | lolcat
    #paleofetch | lolcat # same as neofetch but faster
    # cat $HOME/.cache/neofetch.save | lolcat
    fastfetch
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH:~/.local/bin:~/.local/cargo/bin:$HOME/scripts:$HOME/scripts/bin:/mnt/DATA/anaconda3/bin
export WINEPREFIX=/mnt/DATA/Windowsapp.wine
# PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/system/.config/bspwm/scripts:/home/system/scripts


# Extend PATH.
#path=(~/bin $path)

# plugin & customization
source $HOME/.config/zsh/plugins-customization.zsh

# alias
source $HOME/.config/zsh/aliases.zsh

# utilitys
source $HOME/.config/zsh/utility.zsh

# options
source $HOME/.config/zsh/options.zsh

# environments
source $HOME/.config/zsh/env.zsh

# keybinds
source $HOME/.config/zsh/keybinds.zsh

# prompt
source $HOME/.config/zsh/prompt.zsh


command_not_found_handler() {
    local pkgs cmd="$@"
    printf '\033[0;31m\033[1m-> ERROR: Command not found: %s\n' "$cmd"
    printf '\033[0m'
    printf 'Checking for package.'
    (
        while true; do
            ( sleep 0.1 && printf '.' )
        done
    ) &!
    pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
    kill $!
    echo
    if [[ -n "$pkgs" ]]; then
        printf 'The application %s is not installed. It may be found in the following AUR packages:\n' "$cmd"
        printf '  %s\n' $pkgs[@]
        setopt shwordsplit
        pkg_array=($pkgs[@])
        pkgname="${${(@s:/:)pkg_array}[2]}"
        printf 'Do you want to Install AUR package %s? (y/N) ' $pkgname
        if read -q "choice? "; then
              echo
              echo "Executing command: yay -S $pkgname"
              yay -S $pkgname --noconfirm
              echo " "
              return
            else
              echo " "
              return
        fi
    fi 1>&2
    printf 'Thinking.'
    ( sleep 0.1 && printf '.' ) &!
    ( sleep 0.1 && printf '.' ) &!
    ( sleep 0.1 && printf '.' ) &!
    eval $(thefuck --enable-experimental-instant-mode $@)

    return 127
}

# command not found 
#command_not_found_handler() {
#    package=$(pacman -Ssq wget | grep -x "$1")
#    if [[ ! -z $package ]]; then
#        echo "The command '$1' can be installed on package: $package"
#    else
#      echo "zsh: command not found: $1"
#    fi
#}
#command_not_found_handler() {
#    echo "$1: command not found"
#}

precmd() {
    if [[ "$?" != 0 && "$?" != 127 && "$?" != 2 ]]; then
        printf "\033[0;31m\033[1m-> ERROR: Command Faild to run.\n\n"
        #printf 'Do you want to fuck? (y/N) '
        #if read -q "choice? "; then
        #    fuck $@
        #fi
    #else
    #    printf "\n"
    fi
    printf "\n"
}

# Export environment variables.
#export GPG_TTY=$TTY

# Source additional local files if they exist.
#z4h source ~/.env.zsh

# Autoload functions.
#autoload -Uz zmv

# Define functions and completions.
#function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
#compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
#[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# keybinds
#keybinds
#z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
#z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace
#
#z4h bindkey undo Ctrl+/ Shift+Tab  # undo the last command line change
#z4h bindkey redo Alt+/             # redo the last undone command line change
#
#z4h bindkey z4h-cd-back    Alt+Left   # cd into the previous directory
#z4h bindkey z4h-cd-forward Alt+Right  # cd into the next directory
#z4h bindkey z4h-cd-up      Alt+Up     # cd into the parent directory
#z4h bindkey z4h-cd-down    Alt+Down   # cd into a child directory

#neofetch
#alsi
#colorscript random
#cpufetch
#sysinfo

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fig post block. Keep at the bottom of this file.
#[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# if [ -f $HOME/.cache/prev.dir ]; then
#   cd $(cat $HOME/.cache/prev.dir)
# fi
# function cd {
#   cd $@ && echo $@ > $HOME/.cache/prev.dir
# }
