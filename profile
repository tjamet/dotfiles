function source-all() {
    if [ -e ${1} ]; then
        . $1
    fi
    if [ -d ${1}.d ]; then
        for f in ${1}.d/*; do
            . $f
        done
    fi
}

function source-env() {
    . ~/.profile
}

function gpg-agent-setup() {
    if [ -f ~/.gpg-agent-info ]; then
      . ~/.gpg-agent-info
      export GPG_AGENT_INFO
      export SSH_AUTH_SOCK
    fi
    export GPG_TTY=$(tty)
}

function bashcomplete-setup() {
    if [[ $(uname) == 'Darwin' ]]; then
        source-all `brew --prefix`/etc/bash_completion
    fi
    source-all /etc/bash_completion
    source-all ~/.bash_completion
}

function prompt-setup() {
    source-all ~/.prompt

    reset='\[\033[00m\]'
    blue='\[\033[01;34m\]'
    lightblue='\[\033[01;36m\]'
    green='\[\033[01;32m\]'
    red='\[\033[01;31m\]'
    case "$TERM" in
    xterm*)
        if [ $(id -u) -eq 0 ]; then
            PS1_START="${red}\u@${hostname:-\h}${reset}: ${blue}\w${reset}"
            PS1_END=" # "
        else
            PS1_START="${green}\u@${hostname:-\h}${reset}: ${blue}\w${reset}"
            PS1_END=" \$ "
        fi
        ;;
    *)
        if [ $(id -u) -eq 0 ]; then
            PS1_START='\u@${hostname:-\h}: \w'
            PS1_END=' # '
        else
            PS1_START='\u@${hostname:-\h}: \w'
            PS1_END=' \$ '
        fi
        ;;
    esac
    
    case "$TERM" in
    xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${hostname:-$HOSTNAME}: ${PWD/$HOME/~}\007"'
        ;;
    *)
        ;;
    esac
    
    type __git_ps1 > /dev/null 2>/dev/null
    if [ $? -eq 0 ]; then
        export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
        export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
        PS1="${PS1_START}"'$(__git_ps1   " (%s)") '"${PS1_END}"
    fi
    if [ -z "${PROMPT_COMMAND}" ]; then
        __PROMPT_COMMAND=${PROMPT_COMMAND}
    fi
    PROMPT_COMMAND=${__PROMPT_COMMAND}'echo "$PWD $(history 1)" >> ~/.bash_eternal_history'
}

function alias-setup() {
    source-all ~/.alias
}

function path-setup() {
    if [ -z ${__PATH} ]; then
        export __PATH=${PATH}
    fi
    export PATH=${__PATH}
    source-all ~/.path
}

function local-setup() {
    if [ -e ~/.profile.local ]; then
        . ~/.profile.local
    fi
}

function env-update() {
    local env_dir=
    if [ $# -eq 0 ]; then
        if [ -e ~/.profile ]; then
            env_dir=$(dirname $(readlink ~/.profile))
        else
            echo 'Cannot resolve environment directory, please initialize it with env-setup <DIR>'
            return 1
        fi
    else
        env_dir=${1}
    fi
    for l in $(find ~ -maxdepth 1 -name '.*' -type l); do
        [ -e $l ] || rm -v $l
    done
    for f in $(ls ${env_dir}); do
        [ -e ~/.$(basename ${f}) ] || ln -vs ${env_dir}/$f ~/.$(basename ${f})
    done
    [ -e ~/.bashrc ] || ln -vs ${env_dir}/profile ~/.bashrc
}


path-setup
alias-setup
gpg-agent-setup
bashcomplete-setup
prompt-setup
local-setup
