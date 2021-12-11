type zsh >/dev/null 2>/dev/null && exec zsh

echo "this shell is not fully supported but zsh was not found."


source-all() {
    if [ -e ${1} ]; then
        . $1
    fi
    if [ -d ${1}.d ]; then
        for f in ${1}.d/*; do
            . $f
        done
    fi
}

source-env() {
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
        case ${SHELL} in
            */zsh)
                FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
                autoload -Uz compinit
                compinit
            ;;
            *)
                source-all `brew --prefix`/etc/bash_completion
            ;;
        esac
    fi
    source-all /etc/bash_completion
    source-all ~/.bash_completion
}

function add-prompt-command {
    if ! [ -z "${PROMPT_COMMAND}" ];then
        PROMPT_COMMAND=${PROMPT_COMMAND}';'
    fi
    PROMPT_COMMAND=${PROMPT_COMMAND}"$@"
}

function prompt-setup() {
    if [ -z "${__PROMPT_COMMAND}" ]; then
        __PROMPT_COMMAND=${PROMPT_COMMAND}
    fi
    PROMPT_COMMAND=${__PROMPT_COMMAND}
    source-all ~/.prompt
    if ! powerline-go 2>/dev/null >/dev/null ; then

        function __local_ps1() {
            type __userhost_ps1 > /dev/null 2>/dev/null && __userhost_ps1
            type __curdir_ps1 > /dev/null 2>/dev/null && __curdir_ps1
            type __git_ps1 > /dev/null 2>/dev/null && __git_ps1   " (%s)"
            type __docker_host_ps1 > /dev/null 2>/dev/null && __docker_host_ps1
            echo ' $ '
        }

        export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
        export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
        PS1='$(__local_ps1 )'
    fi
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
    for f in $(ls ~/.setup.d/); do
        f=$(basename $f)
        if [ -x ~/.setup.d/${f} ]; then
            ~/.setup.d/${f}
        else
            echo "~/.setup.d/${f} is not executable, please allow its execution for its setup"
        fi
    done
}


function x-setup() {
    [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
}

function install-go() {
    go get -u -d $2
    go build -o ~/.bin/$1 $2
}

function install-all-tools() {
    mkdir -p $HOME/.bin
    # TODO: install latest? go
    install-go pass github.com/gopasspw/gopass
    brew --help >/dev/null 2>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install gpg git pinentry-mac
    install-go whalebrew github.com/whalebrew/whalebrew
    install-go powerline-go-datadog github.com/tjamet/powerline-go-datadog
}


path-setup
alias-setup
gpg-agent-setup
bashcomplete-setup
prompt-setup
if [[ $(uname) == Linux ]]; then
    x-setup
fi
local-setup
