#!/bin/bash

echo "Load ${0##*/}"

# bash custom prompt
export PS1="%n@%~%# "

# homebrew
export PATH="/usr/local/sbin:$PATH"
