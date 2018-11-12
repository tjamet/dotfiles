if powerline-go 2>/dev/null >/dev/null ; then
    function _update_ps1() {
        if [[ "${TERM_PROGRAM}" == 'vscode' ]]; then
            mode=compatible
        else
            mode=patched
        fi
        PS1="$(powerline-go -mode ${mode} -error $? -modules user,host,ssh,docker,kube,cwd,perms,git,hg,jobs,exit,root -theme $HOME/.powerline/theme.json --path-aliases dev/src/github.schibsted.io=GHE,dev/src/github.com=GH)"
    }
    add-prompt-command _update_ps1
fi
