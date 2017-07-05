#!/bin/bash

set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install gpg pass bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

d=$(dirname $0)
. $(d/profile)
env-update $d

git clone https://github.com/tjamet/pass-env.git ~/pass-env

type go > /dev/null 2>/dev/null || echo "Please install go, check this URL: https://golang.org/dl/"
