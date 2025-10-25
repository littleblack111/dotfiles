abbr -a g jj
abbr -a gp 'jj git push --tracked'
abbr -a gpd 'jj git push --deleted'
abbr -a gs 'jj st'
abbr -a gl 'jj log'
abbr -a gc 'jj commit -m'
abbr -a gb 'jj bookmark'
abbr -a gi 'jj --ignore-immutable'
abbr -a gr 'jj git remote'
function gd
    if test (count $argv) -ge 2
        jj diff --from $argv[1] --to $argv[2]
    else if test (count $argv) -ge 1
        jj diff --from $argv[1] --to @
    else
        jj diff --from @- --to @
    end
end
