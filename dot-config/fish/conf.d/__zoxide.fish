zoxide init fish --cmd cd | source

# minimal version
# function __zoxide_complete
#     set -l tokens (commandline --current-process --tokenize)
#     set -l token (commandline --cut-at-cursor --current-process --tokenize)

#     if __fish_complete_directories "$tokens[2..-1]" '' | read -lz __out
#         echo $__out
#     else
command zoxide query --exclude (__zoxide_pwd) -- $tokens[2..-1] 2>/dev/null | string replace -a -- (__zoxide_pwd)/ '' | string replace -a -- $HOME '~' | string split0 | string join /
#     end
# end

function __zoxide_complete
    set -l tokens (commandline --current-process --tokenize)
    set -l token (commandline --cut-at-cursor --current-process --tokenize)

    __fish_complete_directories "$tokens[2..-1]" ''
    command zoxide query --exclude (__zoxide_pwd) -- $tokens[2..-1] 2>/dev/null | string replace -a -- (__zoxide_pwd)/ '' | string replace -a -- $HOME '~' | string split0 | string join /
end

complete --erase --command __zoxide_z
complete --command __zoxide_z --no-files --arguments '(__zoxide_complete)'
