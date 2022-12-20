#!/usr/bin/env bash
# File: bash-aliases.bashrc
# Aliases related to bash commands.

alias ls='ls --color=auto -F'
alias l='ls --color=auto -lh'
alias ll='ls --color=auto -lh -a'
alias la='ls --color=auto -a'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# {{{ root aliases
if [[ ${EUID} -eq 0 ]] ; then
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
fi
# }}}

# vim: fdm=marker ft=bash
