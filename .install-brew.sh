#!/bin/sh

type brew 2>/dev/null >/dev/null && exit
echo "Installing brew"
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

