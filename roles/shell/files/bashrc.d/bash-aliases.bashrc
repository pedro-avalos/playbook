#!/usr/bin/env bash
# File: bash-aliases.bashrc

alias vi='vim'

alias diff='nvim -d'

alias ls='ls --color=auto -F'
alias la='ls --color=auto -a'
alias ll='ls --color=auto -lh -a'
alias l='ls --color=auto -lh'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias bathelp='bat -p -l help'
function help() {
  "$@" --help 2>&1 | bathelp
}
function batdiff() {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# {{{ root aliases
if [[ ${EUID} -eq 0 ]] ; then
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
fi
# }}}

# vim: fdm=marker ft=bash
