##
## Prompt
##

# reload cache i think
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ $DISPLAY ]]; then
# powerlevel
    source ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    source ~/.p10k.zsh
else
    #PS1='[%n@%m %~]\$ '
    PS1='%F{green}[%F{reset}%F{red}%n%F{reset}%F{yellow}@%F{reset}%F{green}%m%F{reset}:%F{cyan}%~%F{reset}%F{green}]%F{reset}$ '
fi

# vim:ft=zsh
