
#!/bin/bash

set -x LOG_HASH "%C(always,yellow)%h%C(always,reset)"
set -x LOG_RELATIVE_TIME "%C(always,green)(%ar)%C(always,reset)"
set -x LOG_AUTHOR "%C(always,blue)<%an>%C(always,reset)"
set -x LOG_REFS "%C(always,red)%d%C(always,reset)"
set -x LOG_SUBJECT "%s"

set -x LOG_FORMAT "$LOG_HASH}$LOG_AUTHOR}$LOG_RELATIVE_TIME}$LOG_SUBJECT $LOG_REFS"

set -x BRANCH_PREFIX "%(HEAD)"
set -x BRANCH_REF "%(color:red)%(color:bold)%(refname:short)%(color:reset)"
set -x BRANCH_HASH "%(color:yellow)%(objectname:short)%(color:reset)"
set -x BRANCH_DATE "%(color:green)(%(committerdate:relative))%(color:reset)"
set -x BRANCH_AUTHOR "%(color:blue)%(color:bold)<%(authorname)>%(color:reset)"
set -x BRANCH_CONTENTS "%(contents:subject)"

set -x BRANCH_FORMAT "}$BRANCH_PREFIX}$BRANCH_REF}$BRANCH_HASH}$BRANCH_DATE}$BRANCH_AUTHOR}$BRANCH_CONTENTS"

function show_git_head
    pretty_git_log -1
    git show -p --pretty="tformat:"
end

function pretty_git_log
    git log --since="12 months ago" --graph --pretty="tformat:$LOG_FORMAT" $argv | pretty_git_format | git_page_maybe
end

function pretty_git_log_all
    git log --all --since="12 months ago" --graph --pretty="tformat:$LOG_FORMAT" $argv | pretty_git_format | git_page_maybe
end

function gb
    git branch -v --color=always --format=$BRANCH_FORMAT --sort=-committerdate $argv | pretty_git_format
end

function pretty_git_format
    sed -Ee 's/(^[^)]*) ago\)/\1)/' \
    | sed -Ee 's/(^[^)]*), [[:digit:]]+ .*months?\)/\1)/' \
    | sed -Ee 's/ seconds?\)/s\)/' \
    | sed -Ee 's/ minutes?\)/m\)/' \
    | sed -Ee 's/ hours?\)/h\)/' \
    | sed -Ee 's/ days?\)/d\)/' \
    | sed -Ee 's/ weeks?\)/w\)/' \
    | sed -Ee 's/ months?\)/M\)/' \
    | sed -Ee 's/<Andrew Burgess>/<me>/' \
    | sed -Ee 's/<([^ >]+) [^>]*>/<\1>/' \
    | column -s '}' -t
end

#alias tree='tree -a -I .git'
# alias commit="git add . && git commit -m"
# alias push="git push"
abbr -a git-rm "git ls-files --deleted -z | xargs -0 git rm"
# alias g=git
#alias ga='git add'
# alias gaa='git add --all'
# alias gam='git am'
# alias gama='git am --abort'
# alias gamc='git am --continue'
# alias gams='git am --skip'
# alias gamscp='git am --show-current-patch'
# alias gap='git apply'
# alias gapa='git add --patch'
# alias gapt='git apply --3way'
# alias gau='git add --update'
# alias gav='git add --verbose'
# alias gb='git branch'
# alias gbD='git branch -D'
# alias gba='git branch -a'
# alias gbd='git branch -d'
# alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
# alias gbl='git blame -b -w'
# alias gbnm='git branch --no-merged'
# alias gbr='git branch --remote'
# alias gbs='git bisect'
# alias gbsb='git bisect bad'
# alias gbsg='git bisect good'
# alias gbsr='git bisect reset'
# alias gbss='git bisect start'
#alias gc='git commit -v'
# alias 'gc!'='git commit -v --amend'
# alias gca='git commit -v -a'
# alias 'gca!'='git commit -v -a --amend'
# alias gcam='git commit -a -m'
# alias 'gcan!'='git commit -v -a --no-edit --amend'
# alias 'gcans!'='git commit -v -a -s --no-edit --amend'
# alias gcas='git commit -a -s'
# alias gcasm='git commit -a -s -m'
# alias gcb='git checkout -b'
# alias gcd='git checkout $(git_develop_branch)'
# alias gcf='git config --list'
# alias gclr='git clone --recurse-submodules'
# alias gcld='git clone --depth'
# alias gclean='git clean -id'
# alias gcm='git checkout $(git_main_branch)'
# alias gcmsg='git commit -m'
# alias 'gcn!'='git commit -v --no-edit --amend'
# alias gco='git checkout'
# alias gcor='git checkout --recurse-submodules'
# alias gcount='git shortlog -sn'
# alias gcp='git cherry-pick'
# alias gcpa='git cherry-pick --abort'
# alias gcpc='git cherry-pick --continue'
# alias gcs='git commit -S'
# alias gcsm='git commit -s -m'
# alias gcss='git commit -S -s'
# alias gcssm='git commit -S -s -m'
abbr -a gd "git diff"
# alias gdca='git diff --cached'
# alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
# alias gdcw='git diff --cached --word-diff'
# alias gds='git diff --staged'
# alias gdt='git diff-tree --no-commit-id --name-only -r'
# alias gdup='git diff @{upstream}'
# alias gdw='git diff --word-diff'
# alias gf='git fetch'
# alias gfa='git fetch --all --prune --jobs=10'
# alias gfg='git ls-files | grep'
# alias gfo='git fetch origin'
# alias gg='git gui citool'
# alias gga='git gui citool --amend'
# alias ggpull='git pull origin "$(git_current_branch)"'
# alias ggpur=ggu
# alias ggpush='git push origin "$(git_current_branch)"'
# alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
# alias ghh='git help'
# alias gignore='git update-index --assume-unchanged'
# alias gignored='git ls-files -v | grep "^[[:lower:]]"'
# alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
# alias gk='\gitk --all --branches &!'
# alias gke='\gitk --all $(git log -g --pretty=%h) &!'
# alias gl='git pull'
# alias glg='git log --stat'
# alias glgg='git log --graph'
# alias glgga='git log --graph --decorate --all'
# alias glgm='git log --graph --max-count=10'
# alias glgp='git log --stat -p'
# alias glo='git log --oneline --decorate'
# alias globurl='noglob urlglobber '
# alias glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
# alias glods='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
# alias glog='git log --oneline --decorate --graph'
# alias gloga='git log --oneline --decorate --graph --all'
# alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'
# alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --all'
# alias glols='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --stat'
# alias glp=_git_log_prettily
# alias glum='git pull upstream $(git_main_branch)'
# alias gm='git merge'
# alias gma='git merge --abort'
# alias gmom='git merge origin/$(git_main_branch)'
# alias gmtl='git mergetool --no-prompt'
# alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
# alias gmum='git merge upstream/$(git_main_branch)'
# alias gpd='git push --dry-run'
# alias gpf='git push --force-with-lease'
# alias 'gpf!'='git push --force'
# alias gpoat='git push origin --all && git push origin --tags'
# alias gpr='git pull --rebase'
# alias gpristine='git reset --hard && git clean -dffx'
# alias gpsup='git push --set-upstream origin $(git_current_branch)'
# alias gpu='git push upstream'
# alias gpv='git push -v'
# alias gpd='git push origin --delete'
abbr -a gr "git remote"
# alias gra='git remote add'
# alias grb='git rebase'
# alias grwh='git rm --cached `git ls-files -i -c --exclude-from=.gitignore`'
# alias grwhx='git ls-files -i -c --exclude-from=.gitignore | xargs git rm --cached'
# alias grad='git rm -r --cached . && git add .'
# alias grba='git rebase --abort'
# alias grbc='git rebase --continue'
# alias grbd='git rebase $(git_develop_branch)'
# alias grbi='git rebase -i'
# alias grbm='git rebase $(git_main_branch)'
# alias grbo='git rebase --onto'
# alias grbom='git rebase origin/$(git_main_branch)'
# alias grbs='git rebase --skip'
# alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
# alias grev='git revert'
# alias grh='git reset'
# alias grhh='git reset --hard'
# alias grm='git rm'
# alias grmc='git rm --cached'
# alias grmv='git remote rename'
# alias groh='git reset origin/$(git_current_branch) --hard'
# alias grrm='git remote remove'
# alias grs='git restore'
# alias grset='git remote set-url'
# alias grss='git restore --source'
# alias grst='git restore --staged'
# alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
# alias gru='git reset --'
# alias grup='git remote update'
# alias grv='git remote -v'
# alias gsb='git status -sb'
# alias gsd='git svn dcommit'
# alias gsh='git show'
# alias gsi='git submodule init'
# alias gsps='git show --pretty=short --show-signature'
# alias gsr='git svn rebase'
# alias gss='git status -s'
# alias gst='git status'
# alias gsta='git stash push'
# alias gstaa='git stash apply'
# alias gstall='git stash --all'
# alias gstc='git stash clear'
# alias gstd='git stash drop'
# alias gstl='git stash list'
# alias gstp='git stash pop'
# alias gsts='git stash show --text'
# alias gstu='gsta --include-untracked'
# alias gsu='git submodule update'
# alias gsw='git switch'
# alias gswc='git switch -c'
# alias gswd='git switch $(git_develop_branch)'
# alias gswm='git switch $(git_main_branch)'
# alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
# alias gts='git tag -s'
# alias gtv='git tag | sort -V'
# alias gunignore='git update-index --no-assume-unchanged'
# alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
# alias gup='git pull --rebase'
# alias gupa='git pull --rebase --autostash'
# alias gupav='git pull --rebase --autostash -v'
# alias gupv='git pull --rebase -v'
# alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
# alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
# alias gcl='git clone --recurse-submodules'
abbr -a gl "git log --decorate --graph"
function gcl
    git clone --recurse-submodules $argv; or gh repo clone $argv -- --recurse-submodules
end
# alias gi='git init'
# alias gl='git log'
#alias ga='git add'
# alias gc='git commit -am'
abbr -a gc "git commit --verbose -S -m"
abbr -a gcnm 'git commit --verbose --allow-empty-message -S -m ""'
abbr -a gca "git commit --verbose -S -am"
# alias gp='git push origin main'
# alias gp='git remote | xargs -L1 git push --all' # moved to funcs
abbr -a gp 'git remote | xargs -L1 git push'
abbr -a gpd 'git remote | xargs -L1 git push --delete'
# alias gpf='git push --force-with-lease'
abbr -a gitp 'git remote | xargs -L1 git pull'
abbr -a gs "git status"
abbr -a gitrm "git rm --cached -rf"
# alias gsb='git switch'
# alias gcb='git checkout -b'
# alias gu='ga && gc update && git push'
function ghcl
    gh repo clone $argv -- --recurse-submodules
end
# alias ghdb='git push origin --delete'
# alias ghcr='gh repo create'
# alias ghpr='gh pr'
# alias ghis='gh issue'
abbr -a bisectundo 'git bisect log | head -n -2 > /tmp/fixed_bisect.log ; git bisect replay /tmp/fixed_bisect.log'
