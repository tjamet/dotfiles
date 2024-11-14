#!/bin/sh
#
type brew 2>/dev/null >/dev/null && exit
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

