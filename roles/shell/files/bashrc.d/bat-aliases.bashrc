#!/usr/bin/env bash
# File: bat-aliases.bashrc
# Aliases related to bat.

# Interprets stdin as a help menu; displays it with the appropriate highlighting.
alias bathelp='bat --plain --language=help'

# Runs a command with the `--help` option and displays it using `bathelp`.
# Usage: `help <prog>`
# Example: `help bat` is equivalent to `bat --help`
function help() {
  "$@" --help 2>&1 | bathelp
}

# `git diff`, but pretty
function batdiff() {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# vim: ft=bash
