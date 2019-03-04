if powerline-go 2>/dev/null >/dev/null ; then
    if [ -e $HOME/.powerline/theme.json ]; then
        THEME="-theme $HOME/.powerline/theme.json"
    else
        echo "missing powerline theme $HOME/.powerline/theme.json"
        THEME=""
    fi
    function _update_ps1() {
        if [[ "x${VSCODE_PID}" != 'x' ]]; then
            mode=compatible
        else
            mode=patched
        fi
        PS1="$(powerline-go -condensed -mode ${mode} -error $? -modules user,host,datadog,ssh,docker,kube,schip,cwd,perms,git,hg,jobs,exit,root ${THEME} --path-aliases dev/src/github.schibsted.io=GHE,dev/src/github.com=GH)"
    }
    add-prompt-command _update_ps1
fi
