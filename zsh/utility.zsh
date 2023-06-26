##
## Utility Functions
##
#
### TODO: 245

function _smooth_fzf() {
  local fname
  local current_dir="$PWD"
  cd "${XDG_CONFIG_HOME:-~/.config}"
  fname="$(fzf)" || return
  $EDITOR "$fname"
  cd "$current_dir"
}

function _sudo_replace_buffer() {
  local old=$1 new=$2 space=${2:+ }

  # if the cursor is positioned in the $old part of the text, make
  # the substitution and leave the cursor after the $new text
  if [[ $CURSOR -le ${#old} ]]; then
    BUFFER="${new}${space}${BUFFER#$old }"
    CURSOR=${#new}
  # otherwise just replace $old with $new in the text before the cursor
  else
    LBUFFER="${new}${space}${LBUFFER#$old }"
  fi
}

function _sudo_command_line() {
  # If line is empty, get the last run command from history
  [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"

  # Save beginning space
  local WHITESPACE=""
  if [[ ${LBUFFER:0:1} = " " ]]; then
    WHITESPACE=" "
    LBUFFER="${LBUFFER:1}"
  fi

}
    # If $SUDO_EDITOR or $VISUAL are defined, then use that as $EDITOR
    # Else use the default $EDITOR
    #local EDITOR=${SUDO_EDITOR:-${VISUAL:-$EDITOR}}

    # If $EDITOR is not set, just toggle the sudo prefix on and off
    #if [[ -z "$EDITOR" ]]; then
    #  case "$BUFFER" in
    #    sudo\ -e\ *) _sudo_replace_buffer "sudo -e" "" ;;
    #    sudo\ *) _sudo_replace_buffer "sudo" "" ;;
    #    *) LBUFFER="sudo $LBUFFER" ;;
    #  esac
    #  return
    #fi

    # Check if the typed command is really an alias to $EDITOR

    # Get the first part of the typed command
    #local cmd="${${(Az)BUFFER}[1]}"
    # Get the first part of the alias of the same name as $cmd, or $cmd if no alias matches
    # local realcmd="${${(Az)aliases[$cmd]}[1]:-$cmd}"
    # Get the first part of the $EDITOR command ($EDITOR may have arguments after it)
    # local editorcmd="${${(Az)EDITOR}[1]}"

    # Note: ${var:c} makes a $PATH search and expands $var to the full path
    # The if condition is met when:
    # - $realcmd is '$EDITOR'
    # - $realcmd is "cmd" and $EDITOR is "cmd"
    # - $realcmd is "cmd" and $EDITOR is "cmd --with --arguments"
    # - $realcmd is "/path/to/cmd" and $EDITOR is "cmd"
    # - $realcmd is "/path/to/cmd" and $EDITOR is "/path/to/cmd"
    # or
    # - $realcmd is "cmd" and $EDITOR is "cmd"
    # - $realcmd is "cmd" and $EDITOR is "/path/to/cmd"
    # or
    # - $realcmd is "cmd" and $EDITOR is /alternative/path/to/cmd that appears in $PATH
#    if [[ "$realcmd" = (\$EDITOR|$editorcmd|${editorcmd:c}) \
#      || "${realcmd:c}" = ($editorcmd|${editorcmd:c}) ]] \
#      || builtin which -a "$realcmd" | command grep -Fx -q "$editorcmd"; then
#      _sudo_replace_buffer "$cmd" "sudo -e"
#      return
#    fi

    # Check for editor commands in the typed command and replace accordingly
#    case "$BUFFER" in
#      $editorcmd\ *) _sudo_replace_buffer "$editorcmd" "sudo -e" ;;
#      \$EDITOR\ *) _sudo_replace_buffer '$EDITOR' "sudo -e" ;;
#      sudo\ -e\ *) _sudo_replace_buffer "sudo -e" "$EDITOR" ;;
#      sudo\ *) _sudo_replace_buffer "sudo" "" ;;
#      *) LBUFFER="sudo $LBUFFER" ;;
#    esac
#  } always {
#    # Preserve beginning space
#    LBUFFER="${WHITESPACE}${LBUFFER}"
#    # Redisplay edit buffer (compatibility with zsh-syntax-highlighting)
#    zle redisplay
#  }
#}

function _vi_search_fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}

function toppy() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
}

#function cd() {
	#builtin cd "$@" && command lsd
#}

function git-svn(){
  if [[ ! -z "$1" && ! -z "$2" ]]; then
          echo "Starting clone/copy ..."
          repo=$(echo $1 | sed 's/\/$\|.git$//')
          svn export "$repo/trunk/$2"
  else
          echo "Use: git-svn <repository> <subdirectory>"
  fi  
}

# vim with auto sudo
function vim () {
    if [ ! "$@" ]; then
        #printf "No arguments passed in, need \$@ - file is required\n"
        #printf "\$@ Argument required.\n"
        printf "File name argument required.\n"
        return 1
    fi
	if [ ! -e "$@" ]
	then
        printf "$@ doesn't exist\ntouch File '$@'?(y/N)"
        if read -q "choice? "
        then
            echo
		    #DIR=$(dirname "$@")
		    #OWNER=$(stat -c '%U' "$DIR")
            #if [[ "$OWNER" == "root" ]]
            #if [[ "$OWNER" != "$USER" ]]
            if [ ! -w "$(dirname $@)" ]
            then
                printf "Opening vim with sudo...\n"
                sudo /usr/bin/nvim "$@"
                if [ ! -e "$@" ]
                then
                    #printf "File \"$@\" is Empty, auto deleted...\n"
                    printf "File \"$@\" is isn't saved, auto deleted...\n"
                    return
                fi
                return
            #elif [[ -e "$@" ]]
            else
                printf "Opening vim...\n"
                /usr/bin/nvim "$@"
                if [ ! -e "$@" ]
                then
                    #printf "File \"$@\" is Empty, auto deleted...\n"
                    printf "File \"$@\" is isn't saved, auto deleted...\n"
                    return
                fi
                return
            fi

        else
            printf '\nExiting...\n'
            return
        fi
	#else
		#OWNER=$(stat -c '%U' "$@")
	fi
    if [ ! -w "$@" ]
	then
        printf "Opening vim with sudo...\n"
		sudo /usr/bin/nvim "$@"
        return
	elif [[ -e "$@" ]]; then
        printf "Opening vim...\n"
		/usr/bin/nvim "$@"
        return
	fi
#    if [ -e "$@" ]
#    then
#        if ! test -s $@; then
#            printf "$@ is empty\nrm $1?(y/N)"
#            if read -q "choice? "
#            then
#                echo
#                if [[ "$OWNER" == "root" ]]; then
#                    sudo rm "$@"
#                else
#                    rm "$@"
#                fi
#            fi
#        fi
#    fi
}

#function cd() {
#    if [[ ! -e "$@" && "$@" != "-" ]]; then
#        printf "'$@' doesn't exist\nmkdir '$@'?(y/N)"
#        if read -q "choice? "; then
#            echo
#            if [ ! -w "$(dirname $@)" ]
#            then
#                printf "Making dir with sudo...\n"
#                sudo /usr/bin/mkdir "$@"
#                return
#            #elif [[ -e "$@" ]]
#            else
#                printf "Making dir...\n"
#                /usr/bin/mkdir "$@"
#                return
#            fi
#        fi
#    fi
#    builtin cd "$@"
#
#}

##############################################
### i found out those won't work with pipe ###
##############################################

#function cat () {
#	if [ ! -e "$1" ]
#	then
#		DIR=$(dirname "$1")
#		OWNER=$(stat -c '%U' "$DIR")
#	else
#		OWNER=$(stat -c '%U' "$1")
#	fi
#	if [[ "$OWNER" == "root" ]]
#	then
#		sudo /usr/bin/bat --pager=never "$1"
#	else
#		/usr/bin/bat --pager=never "$1"
#	fi
#}

#function less () {
#	if [ ! -e "$1" ]
#	then
#		DIR=$(dirname "$1")
#		OWNER=$(stat -c '%U' "$DIR")
#	else
#		OWNER=$(stat -c '%U' "$1")
#	fi
#	if [[ "$OWNER" == "root" ]]
#	then
#		sudo /usr/bin/less "$1"
#	else
#		/usr/bin/less "$1"
#	fi
#}

# move applications
function move_to_desktop {
    while [ true ]
    do
        # new apps are spawned on desktop 1
        W=$(bspc query -W -d ^1)
        echo "[$W]"
        if [ -n "$W" ];
        then
            break
        fi
    done
    # $1 is passed in desktop, i.e. ^3
    $(bspc window $W --to-desktop $1)
}

function unzip ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   mkdir ${1%.tar.bz2} && tar xvjf $1 -C ${1%.tar.bz2}   ;;
      *.tar.gz)    mkdir ${1%.tar.gz} && tar xvzf $1 -C ${1%.tar.gz}   ;;
      *.tar.xz)    mkdir ${1%.tar.xz} && xz -d -v $1 ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       mkdir ${1%.*} && tar xvf $1    ;;
      *.tbz2)      mkdir ${1%.*} && tar xzjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       /usr/bin/unzip $1 -d ${1%.*}    ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via unzip()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function nix-upgrade ()
{
  nix-env -u
}

function nix-install ()
{
  nix-env -iA nixpkgs.$@
}

function nix-search ()
{
    nix search nixpkgs $@
}

function ga ()
{
  if [[ -n "${1+x}" ]]; then
    git add $1 -f
  else
    git add -A -f
  fi
}

function linuxcmd ()
{
    #$(which $@)
    "/usr/bin/$@"
}

function gcco()
{
  if [ -n "${2+x}" ]; then
    gcc -Wall -Wextra -std=c11 -g $1 -o $2
  else
    gcc -Wall -Wextra -std=c11 -g $1 -o ${1%.*}.o
 fi
}

function gccd ()
{
  if [ -n "${2+x}" ]; then
    gcc -Wall -Wextra -std=c11 -g -c $1 -o $2
  else
    gcc -Wall -Wextra -std=c11 -g -c $1 -o ${1%.*}.o
  fi
}

function whatisin ()
{
  cat $(which $@)
}

function path ()
{
  echo "$(pwd)/${1}"
}

function vimake ()
{
  if [ -e "Makefile" ]; then  
    nvim Makefile
  else
    printf "No Makefile"
  fi
}

function vimpkg ()
{
  if [ -e "PKGBUILD" ]; then  
    nvim PKGBUILD
  else
    printf "No PKGBUILD"
  fi
}

function installpipreqs ()
{
    if [ -e "requirements.txt" ]; then
        pip install -r requirements.txt
    else
        echo "There isn't a requirements.txt"
    fi
}

function compress ()
{
  # TODO: MAKE MULTI COMPRESS OPTIONS
  zip ${1%.*} -r $1
}

# vim:ft=sh

function txt2ascii ()
{
    # banner [-c ]
    # toilet
    figlet $@
}


function killZombie() {
    pid=$(ps -A -ostat,ppid | awk '/[zZ]/ && !a[$2]++ {print $2}');
    if [ "$pid" = "" ]; then
        echo "No zombie processes found.";
    else
        cmd=$(ps -p $pid -o cmd | sed '1d');
        echo "Found zombie process PID: $pid";
        echo "$cmd";
        echo "Kill it? Return to continue… (ctrl+c to cancel)";
        read -r;
        sudo kill -9 $pid;
    fi
}
