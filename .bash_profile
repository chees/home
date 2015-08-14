export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


parse_git_branch()
{
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

git_stash_list()
{
 git stash list 2> /dev/null | wc -l | sed -e 's/ //g' -e 's/^0$//' -e 's/\([1-9][0-9]*\)/ \1/'
}

RESET="\[\e[0;37m\]"
YELLOW="\[\e[0;33m\]"
GREEN="\[\e[0;32m\]"

TITLEBAR='\[\e]0;${PWD/$HOME/~}\a\]'
PS1="${TITLEBAR}$YELLOW\w$GREEN\$(parse_git_branch)$RESET\$(git_stash_list)$YELLOW $ $RESET"
