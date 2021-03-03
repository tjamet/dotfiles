#!/bin/bash



if [[ "$(uname)" ==  Darwin ]]; then
    sha256sum(){
            shasum -a 256
    }
fi

execFile(){
    if [ $# -lt 3 ];then
        echo "Usage: execFile <URL> <sha256sum> <shell>"
        return 1
    fi
    f=$(mktemp)
    trap "rm $f" RETURN
    curl -fsSL "$1" > ${f}
    checksum=$(cat $f | sha256sum | awk '{print $1}')
    if [[ "${checksum}" != $2 ]]; then
        echo "Invalid checksum ${checksum} for $1, expecting $2"
        return 1
    fi
    shell=$3
    shift 3
    ${shell} ${f} "$@"
}

if [[ "$(uname)" == Darwin ]]; then
    type brew > /dev/null || execFile "https://raw.githubusercontent.com/Homebrew/install/master/install" f5eb0eaf76e723984d99a5331088dc4fccefd0f44f1113e748b1f7774b343ebf ruby
fi

#brew install gpg

d=$(dirname $0)
. ${d}/profile
env-update $d

if ! [ -d ~/pass-env ]; then
    git clone https://github.com/tjamet/pass-env.git ~/pass-env
fi

execFile https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh 061a40238146fdb5b08b41b22247abf5338bc87f6743386059f6663ac4b95798 sh --unattended

type go > /dev/null 2>/dev/null || echo "Please install go, check this URL: https://golang.org/dl/"
