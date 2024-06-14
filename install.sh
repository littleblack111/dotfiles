# !/usr/bin/env zsh

R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
N='\033[0m'

function packageinstall() {
    if ! $pm; then
        outputVerbose working "Trying to get package manager..."
        if have_command apt-get; then
            pm="apt-get"
        elif have_command yum; then
            pm="yum"
        elif have_command dnf; then
            pm="dnf"
        elif have_command pacman; then
            pm="pacman"
        else
            fail "Could not find package manager."
            exit 1
        fi
        outputVerbose success "Found package manager: $G$pm$N"
    fi
    outputVerbose working "Trying to installing package: $G$1$N"
    case $pm in
        apt-get)
            sudo apt-get install $1
            ;;
        yum)
            sudo yum install $1
            ;;
        dnf)
            sudo dnf install $1
            ;;
        pacman)
            sudo pacman -S $1
            ;;
    esac
    outputVerbose success "Installed package: $G$1$N"
}

function working() {
    echo "${Y}[-]$N $@"
}

function success() {
    echo "${G}[SUCCESS]$N $@"
}

function fail() {
    echo "$R[FAIL]$N $@"
}

function outputVerbose() {
    if $verbose; then
        $1 ${@:2}
    fi
}

function have_command() {
	outputVerbose working "Checking if you have command: $G"
    if $verbose; then
        if command -v $1; then
            echo -n "$N"
            return 0
        else
            echo -n "$N"
            return 1
        fi
    else
        if command -v $1 > /dev/null; then
            return 0
        else
            return 1
        fi
    fi
}

echo -n "Do you want to see more verbose output? (${G}y${N}/${R}N$N): "
if read -q "choice? "; then
    verbose=true
else
    verbose=false
fi
echo


outputVerbose working "Checking if you are root..."
UID=$(id -u)
if [ $UID -eq 0 ]; then
    fail "You must be a user to run the script."
    exit 1
else
    success "You are not root."
fi

if $verbose; then
    packages=$(cat package.list) || outputVerbose fail "Could not find package.list." || outputVerbose working "Trying to fetch from remote..." || packages=$(curl -fsSL https://github.com/littleblack111/dotfiles/raw/main/package.list) || outputVerbose fail "Could not fetch package.list." || exit 1
else
    packages=$(cat package.list 2> /dev/null) || packages=$(curl -fsSL https://github.com/littleblack111/dotfiles/raw/main/package.list 2> /dev/null) || exit 1
fi


# Iterate over each package separated by space
for package in $packages; do
    outputVerbose working "Checking what commands you have..."
    if have_command "$package"; then
        success "You have $package."
    else
        fail "You do not have $package."
        packageinstall "$package"
    fi
done
outputVerbose success "You have all the commands you need."
