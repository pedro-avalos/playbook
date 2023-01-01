#!/usr/bin/env bash
# File: bash-path.bashrc
# Add executable paths to PATH environmental variable.

if [[ -d ${HOME}/bin ]] ; then
  PATH="${PATH}:${HOME}/bin"
fi

if [[ -d ${HOME}/.local/bin ]] ; then
  PATH="${PATH}:${HOME}/.local/bin"
fi

# Doom Emacs
if [[ -d ${HOME}/.emacs.d/bin ]] ; then
  PATH="${PATH}:${HOME}/.emacs.d/bin"
fi

export PATH

# vim: ft=bash
