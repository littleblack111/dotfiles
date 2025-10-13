# vim with auto sudo
function vim
    if test (count $argv) -eq 0
        if not test -w (pwd)
            printf "Opening vim with sudo...\n"
            sudo -E $EDITOR
            return
        else
            printf "Opening vim...\n"
            $EDITOR
            return
        end
    end

    if not test -e $argv[1]
        printf "%s doesn't exist\ntouch File '%s'?(y/N)" $argv[1] $argv[1]
        read -l choice
        if test "$choice" = y -o "$choice" = Y
            echo
            if not test -w (dirname $argv[1])
                printf "Opening vim with sudo...\n"
                sudo -E $EDITOR $argv[1]
                if not test -e $argv[1]
                    printf "File \"%s\" is isn't saved, auto deleted...\n" $argv[1]
                    return
                end
                return
            else
                printf "Opening vim...\n"
                $EDITOR $argv[1]
                if not test -e $argv[1]
                    printf "File \"%s\" is isn't saved, auto deleted...\n" $argv[1]
                    return
                end
                return
            end
        else
            printf '\nExiting...\n'
            return
        end
    end

    if not test -w $argv[1]
        printf "Opening vim with sudo...\n"
        sudo -E $EDITOR $argv[1]
        return
    else if test -e $argv[1]
        printf "Opening vim...\n"
        $EDITOR $argv[1]
        return
    end
end

function unzip
    ouch d --dir (string replace -r '\.[^./]+$' '' -- $argv[1]) $argv
end

function path
    echo (pwd)/$argv[1]
end

function vimake
    if test -e Makefile
        $EDITOR Makefile
    else
        printf "No Makefile"
    end
end

function vimpkg
    if test -e PKGBUILD
        nvim PKGBUILD
    else
        printf "No PKGBUILD"
    end
end

function installpipreqs
    if test -e requirements.txt
        pip install -r requirements.txt
    else
        echo "There isn't a requirements.txt"
    end
end

function killzombie
    set -l pid (ps -A -ostat,ppid | awk '/[zZ]/ && !a[$2]++ {print $2}')
    if test -z "$pid"
        echo "No zombie processes found."
    else
        set -l cmd (ps -p $pid -o cmd | sed '1d')
        echo "Found zombie process PID: $pid"
        echo "$cmd"
        echo "Kill it? Return to continue… (ctrl+c to cancel)"
        read -l
        sudo kill -9 $pid
    end
end

function createrepo
    gh repo create $argv[1] --add-readme --license gpl-3.0 $argv[2..-1] --public
    # tea repo create --name $1 --init --readme Default --license gpl3 --branch main ${@:2}
end

function tempsend
    bw send $argv ^/dev/null | jq -r '.accessUrl'
end
