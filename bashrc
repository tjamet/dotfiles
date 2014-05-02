if [ -e ${TJ_ENV_DIR}/.vimrc ]; then
  alias gvim='gvim -S ${TJ_ENV_DIR}/.vimrc'
else
  echo "WARNING : disabled gvim alias as .vimrc is not found in $TJ_ENV_DIR" >&2 ;
fi

if [ -e ${TJ_ENV_DIR}/.git-completion.sh ]; then
  source ~/.git-completion.sh
else
  echo "WARNING : disabled git auto completion as .git-completion.sh is not found in $TJ_ENV_DIR" >&2 ;
fi
if [ -e ${TJ_ENV_DIR}/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  START=$(echo $PS1 | sed 's:$\([\s]*\)$::')
  # TODO: review this to have the status updated regularly
  PS1="${START}\[\033[32m\]$(__git_ps1 " (%s)")\[\033[0m\] \$ "
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1 PATH
else
  echo "WARNING : disabled git auto completion as .git-prompt.sh is not found in $TJ_ENV_DIR" >&2 ;
fi

export SVN_EDITOR=vi
alias ls='ls -CF --color=tty'


alias h='history'

function fbi () {
find . -name "\.svn" -prune -o -name "%*" -prune -o -type f | xargs grep -i $1 | grep -iv matches
}

function fb () {
find . -name "\.svn" -prune -o -name "%*" -prune -o -type f | grep -i $1 | grep -iv matches
}

#PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo "$PWD $(history 1)" >> ~/.bash_eternal_history'
