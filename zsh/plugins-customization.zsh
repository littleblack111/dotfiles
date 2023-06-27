##
## Plugins
##

# zinit plugin manager
#ZINIT_HOME="${ZINIT_HOME:-${XDG_DATA_HOME:-${HOME}/.local/share}/zinit}"
#source "${ZINIT_HOME}/zinit.git/zinit.zsh"

# zinit plugins
#zinit ice wait'3' lucid
#zinit light zsh-users/zsh-history-substring-search

#zinit ice wait'2' lucid
#zinit light zdharma-continuum/history-search-multi-word

# FZF
#zinit ice from"gh-r" as"command"
#zinit light junegunn/fzf-bin

# EXA
#zinit ice wait lucid from"gh-r" as"program" mv"bin/exa* -> exa"
#zinit light ogham/exa

# BAT
#zinit ice wait lucid from"gh-r" as"program" mv"*/bat -> bat" atload"export BAT_THEME='Nord'"
#zinit light sharkdp/bat

plugins=(
    #git
    #zsh-cwd-history
    zsh-autosuggestions
    #zsh-autocomplete
    zsh-history-substring-search
    zsh-syntax-highlighting
    sudo
    web-search
    copybuffer
    dirhistory
    #fzf-tab
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

zstyle ':omz:update' mode disabled

#zstyle ':omz:update' frequency 13

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

zshcache_time="$(date +%s%N)"

add-zsh-hook -Uz precmd rehash_precmd

# You can manually run `z4h update` to update everything.
#zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
#zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
#zstyle ':z4h:bindkey' keyboard  'pc'

# Don't start tmux.
#zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
#zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
#zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
#zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
#zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
#zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
#zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
#zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
#zstyle ':z4h:ssh:*'               suspend    enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
#zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
#z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
#z4h init || return

# thefuck
eval $(thefuck --alias)

# autojump
source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# homebrew
#[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval "$(/usr/local/linuxbrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/mnt/DATA/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/mnt/DATA/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/mnt/DATA/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/mnt/DATA/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<


# ngrok
#eval "$(/usr/bin/ngrok completion)" # no use

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

# so omz plugin works properly
#source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
#source $ZSH/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
#source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
#source $ZSH/custom/plugins/sudo/sudo.plugin.zsh
#source $ZSH/custom/plugins/web-search/web-search.plugin.zsh
#source $ZSH/custom/plugins/copybuffer/copybuffer.plugin.zsh
#source $ZSH/custom/plugins/dirhistory/dirhistory.plugin.zsh

# nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
