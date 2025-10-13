function fish_command_not_found --description "Fish: suggest/install AUR pkg when command not found"
    set -l cmd $argv
    set -l pkgs

    printf '\033[0;31m\033[1m==> ERROR: Command not found:\033[0m %s\n' "$cmd"
    printf '\033[0m'
    printf 'Checking for package.'

    # spinner: print dots until pkgfile finishes
    set -l spinner_pid
    fish -c '
        while true
            sleep 0.1
            printf "."
        end
    ' &
    set spinner_pid $last_pid

    # query pkgfile; -b (binaries), -v (verbose) to include repo/pkg paths
    set -l out (pkgfile -b -v -- "$cmd" ^/dev/null)

    # stop spinner
    kill $spinner_pid 2>/dev/null
    echo

    if test -n "$out"
        # Split lines into array
        set pkgs $out

        printf 'The application %s is not installed. It may be found in the following AUR packages:\n' "$cmd"
        for p in $pkgs
            printf '  %s\n' "$p"
        end

        # Emulate original logic: take second field after splitting first match by "/"
        # Example line format often like: "aur/pkgname usr/bin/cmd"
        set -l first $pkgs[1]
        set -l parts (string split -m1 ' ' -- $first)[1]
        set -l repo_pkg (string split '/' -- $parts)
        set -l pkgname $repo_pkg[2]

        if test -n "$pkgname"
            printf 'Do you want to Install AUR package %s? (y/N) ' "$pkgname"
            read -l -n 1 choice
            echo
            if test (string lower -- "$choice") = y
                echo "Executing command: yay -S $pkgname"
                yay -S "$pkgname" --noconfirm
                echo
                return
            else
                echo
                return
            end
        end
    end 1>&2

    return 127
end
