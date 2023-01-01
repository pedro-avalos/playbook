#!/usr/bin/env bash
# File: bash-aliases.bashrc
# Aliases related to bash and bash commands.

alias resource='source ~/.bashrc'

# Directory-related aliases
alias ls='ls --color=auto -F'
alias l='ls --color=auto -lh'
alias la='ls --color=auto -a'
alias ll='ls --color=auto -lha'

# Grep-related aliases
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Root aliases
if [[ ${EUID} -eq 0 ]] ; then
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
fi

# vim: ft=bash
