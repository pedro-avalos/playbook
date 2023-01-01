#!/usr/bin/env bash
# File: bash-prompt.bashrc

# Needed for git repo status
if [[ -e ~/.bashrc.d/git-prompt.sh ]] ; then # {{{
  source ~/.bashrc.d/git-prompt.sh
else
  return
fi # }}}

# Settings for git-prompt.sh {{{
export GIT_PS1_SHOWDIRTYSTATE=1     # '*'=unstaged, '+'=staged
export GIT_PS1_SHOWSTASHSTATE=1     # '$'=stashed
export GIT_PS1_SHOWUNTRACKEDFILES=1 # '%'=untracked
export GIT_PS1_STATESEPARATOR=''    # No space betweend branch and index status
# }}}

# Check if the terminal supports colors
function __color_enabled() { # {{{
  local exit=$?
  local -i colors
  colors=$(tput colors 2> /dev/null)
  [[ ${exit} -eq 0 ]] && [[ ${colors} -gt 2 ]]
} # }}}

# Whether to use colors in the prompt
unset __colorize_prompt && __color_enabled && __colorize_prompt=1

# Main icon to the left side of the prompt.
# It will differ depending on whether the shell is running under ssh or tmux.
# This function takes up to three arguments (ssh_icon, tmux_icon, norm_icon).
function __icon_ps1() { # {{{
  local exit=$?       # Exit status
  local ssh_icon='s'  # Icon for ssh connection
  local tmux_icon='t' # Icon for tmux shell
  local norm_icon=''  # Icon normally

  case "$#" in
    0|1|2|3)
      ssh_icon="${1:-${ssh_icon}}"
      tmux_icon="${2:-${tmux_icon}}"
      norm_icon="${3:-${norm_icon}}"
      ;;
    *) return ${exit}
  esac

  if [[ -n ${SSH_CONNECTION} ]] ; then
    printf -- '%s' "${ssh_icon}"
  elif [[ -n ${TMUX} ]] ; then
    printf -- '%s' "${tmux_icon}"
  else
    printf -- '%s' "${norm_icon}"
  fi

  return ${exit}
} # }}}

# Icon for a child shell instance.
function __child_ps1() { # {{{
  local exit=$?        # Exit status
  local child_icon='b' # Icon to display
  local -i child_lvl=1 # What level is required to consider this a child

  case "$#" in
    0|1)
      child_icon="${1:${child_icon}}"
      ;;
    *) return ${exit}
  esac

  # Increase level requirement to 2 in case tmux is being used
  if [[ -n ${TMUX} ]] ; then
    child_lvl=2
  fi

  if [[ ${SHLVL} -gt ${child_lvl} ]] ; then
    printf -- '%s' "${child_icon}"
  fi

  return ${exit}
} # }}}

# Create the bash prompt.
function __set_ps1() { # {{{
  local exit=$?

  # Colors       ; Bright colors
  local _black   ; local _bblack
  local _red     ; local _bred
  local _green   ; local _bgreen
  local _yellow  ; local _byellow
  local _blue    ; local _bblue
  local _magenta ; local _bmagenta
  local _cyan    ; local _bcyan
  local _white   ; local _bwhite
  local _bold
  local _blink
  local _reset

  if [[ ${__colorize_prompt} ]] ; then # {{{
    export GIT_PS1_SHOWCOLORHINTS=1

    _black="\[$(tput setaf 0)\]"   ; _bblack="\[$(tput setaf 8)\]"
    _red="\[$(tput setaf 1)\]"     ; _bred="\[$(tput setaf 9)\]"
    _green="\[$(tput setaf 2)\]"   ; _bgreen="\[$(tput setaf 10)\]"
    _yellow="\[$(tput setaf 3)\]"  ; _byellow="\[$(tput setaf 11)\]"
    _blue="\[$(tput setaf 4)\]"    ; _bblue="\[$(tput setaf 12)\]"
    _magenta="\[$(tput setaf 5)\]" ; _bmagenta="\[$(tput setaf 13)\]"
    _cyan="\[$(tput setaf 6)\]"    ; _bcyan="\[$(tput setaf 14)\]"
    _white="\[$(tput setaf 7)\]"   ; _bwhite="\[$(tput setaf 15)\]"
    _bold="\[$(tput bold)\]"
    _blink="\[$(tput blink)\]"
    _reset="\[$(tput sgr0)\]"
  else
    unset GIT_PS1_SHOWCOLORHINTS
  fi # }}}

  # Set up pre_ps1 {{{
  local ssh_icon='' # Icon for ssh connection
  local tmux_icon='' # Icon for tmux shell
  local norm_icon='' # Icon for local shell
  local child_icon='' # Icon for child shell

  # If root, use upper-case letter.
  # Also use bold red for main icon, bold yellow for child icon.
  if [[ ${EUID} -eq 0 ]] ; then
    ssh_icon+="${_bold}${_red}Σ"
    tmux_icon+="${_bold}${_red}Τ"
    norm_icon+="${_bold}${_red}Λ"
    child_icon+="${_bold}${_yellow}Β"
  else
    ssh_icon+="${_cyan}σ"
    tmux_icon+="${_green}τ"
    norm_icon+="${_bblue}λ"
    child_icon+="${_byellow}β"
  fi

  ssh_icon+="${_reset} "
  tmux_icon+="${_reset} "
  norm_icon+="${_reset} "
  child_icon+="${_reset} "

  local icon_ps1
  local child_ps1

  icon_ps1=$(__icon_ps1 "${ssh_icon}" "${tmux_icon}" "${norm_icon}")
  child_ps1=$(__child_ps1 "${child_icon}")

  local pre_ps1="${icon_ps1}${child_ps1}"

  # If root, only use bold `<hostname>:`
  # Otherwise, use `<user>@<hostname>:`
  if [[ ${EUID} -eq 0 ]] ; then
    pre_ps1+="${_bold}\h${_reset}:"
  else
    pre_ps1+='\u@\h:'
  fi

  # Add the current directory
  pre_ps1+="${_bold}${_blue}\W${_reset}"
  # }}}

  # Set up post_ps1 {{{
  local post_ps1
  post_ps1=''

  # If nonzero exit code, display it in red
  if [[ ${exit} -ne 0 ]] ; then
    post_ps1+="${_red}[${exit}]${_reset}"
  fi

  post_ps1+=' '
  # }}}

  __git_ps1 "${pre_ps1}" "${post_ps1}" '(%s)'
} # }}}

export PROMPT_COMMAND=__set_ps1

# vim: ft=bash fdm=marker
