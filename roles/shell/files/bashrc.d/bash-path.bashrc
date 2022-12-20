#!/usr/bin/env bash
# File: bash-path.bashrc
# Add executable paths to PATH environmental variable.

# {{{ Local executable paths
if [[ -d "${HOME}/bin" ]] ; then
  PATH="${PATH}:${HOME}/bin"
fi

if [[ -d "${HOME}/.local/bin" ]] ; then
  PATH="${PATH}:${HOME}/.local/bin"
fi
# }}}

# {{{ Doom Emacs executable path
if [[ -d "${HOME}/.emacs.d/bin" ]] ; then
  PATH="${PATH}:${HOME}/.emacs.d/bin"
fi
# }}}

export PATH

# vim: fdm=marker ft=bash
