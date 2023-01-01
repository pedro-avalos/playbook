#!/usr/bin/env bash
# File: nvim.bashrc
# Configuration related to neovim and vim

# Check if neovim is available, otherwise use vim
if command -v nvim &> /dev/null ; then # neovim is available
  alias vi='nvim'
  alias vim='nvim'
  alias diff='nvim -d'

  export SUDO_EDITOR='nvim'
  export VISUAL='nvim'
  export EDITOR='nvim'
elif command -v vim &> /dev/null ; then # vim is available
  alias vi='vim'
  alias diff='vim -d'

  export SUDO_EDITOR='vim'
  export VISUAL='vim'
  export EDITOR='vim'
fi

# vim: ft=bash
