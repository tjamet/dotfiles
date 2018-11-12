
function setShellTitle {
    echo -ne "\033]0;"$*"\007"
}

function setShellTitleCurDir {
    setShellTitle $(basename $(pwd))
}

add-prompt-command setShellTitleCurDir
