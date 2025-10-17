function toggle-sudo
    set buf (commandline)

    if test -z "$buf"
        set last (history | head -n1)
        if test -z "$last"
            commandline -r "sudo "
            return
        end
        set buf $last
    end

    if string match -rq '^\s*sudo(\s+|$)' -- $buf
        set new (string replace -r '^\s*sudo\s*' '' -- $buf)
        if test -z "$new"
            commandline -r ""
            return
        end
        commandline -r $new
    else
        commandline -r "sudo $buf"
    end
end
function fish_user_key_bindings
    for m in default insert
        bind -M $m ctrl-f accept-autosuggestion
        bind -M $m ctrl-backspace backward-kill-word
    end

    for m in default insert normal
        bind -M $m alt-left 'commandline -f cancel; cd -; commandline -f repaint'
        bind -M $m alt-up 'commandline -f cancel; cd ..; commandline -f repaint'
        bind -M $m ctrl-e toggle-sudo
        bind -M $m ctrl-r history-pager
    end

    bind -M normal U redo

    for m in default insert normal replace replace_one
        bind --preset --erase -M $m ctrl-h
        bind -M $m ctrl-h backward-char
        bind --preset --erase -M $m ctrl-j
        bind -M $m ctrl-j down-or-search
        bind --preset --erase -M $m ctrl-k
        bind -M $m ctrl-k up-or-search
        # clear overrode
        bind --preset --erase -M $m ctrl-l
        bind -M $m ctrl-l forward-char
    end
end
