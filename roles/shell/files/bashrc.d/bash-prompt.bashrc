#!/usr/bin/env bash
# File: bash-prompt.bashrc

# {{{ git-prompt.sh
# Needed for git repo status
if [[ -e ~/.bashrc.d/git-prompt.sh ]] ; then
  source ~/.bashrc.d/git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1     # '*'=unstaged, '+'=staged
export GIT_PS1_SHOWSTASHSTATE=1     # '$'=stashed
export GIT_PS1_SHOWUNTRACKEDFILES=1 # '%'=untracked
export GIT_PS1_STATESEPARATOR=""    # No space between branch and index status
# }}}

# {{{ __color_enabled
# Check if the terminal supports colors
function __color_enabled() {
  local exit=$?
  local -i colors
  colors=$(tput colors 2> /dev/null)
  [[ ${exit} -eq 0 ]] && [[ ${colors} -gt 2 ]]
}
# }}}

# Whether to use colors in the prompt
unset __colorize_prompt && __color_enabled && __colorize_prompt=1

# {{{ __ssh_ps1
# Check if this bash instance is running in an ssh connection.
# Depending on this, the icon printed will be different.
function __ssh_ps1() {
  local exit=$?
  local ssh_icon='s'
  local local_icon=''
  local ssh_format='%s'
  local local_format='%s'

  case "$#" in
    0|1|2|3|4)
      ssh_icon="${1:-${ssh_icon}}"
      local_icon="${2:-${local_icon}}"
      ssh_format="${3:-${ssh_format}}"
      local_format="${4:-${local_format}}"
      ;;
    *) return $exit
  esac

  if [[ -n $SSH_CONNECTION ]] ; then
    printf -- "${ssh_format}" "${ssh_icon}"
  else
    printf -- "${local_format}" "${local_icon}"
  fi

  return ${exit}
}
# }}}

# {{{ __child_ps1
# Check if this bash instance is a child instance.
# Add an icon if it is a child.
function __child_ps1() {
  local exit=$?
  local child_icon='b'
  local child_format='%s'

  case "$#" in
    0|1|2)
      child_icon="${1:-${child_icon}}"
      child_format="${2:-${child_format}}"
      ;;
    *) return ${exit}
  esac

  if [[ ${SHLVL} -gt 1 ]] ; then
    printf -- "${child_format}" "${child_icon}"
  fi

  return ${exit}
}
# }}}

# {{{ __set_ps1
# Create the bash prompt.
function __set_ps1() {
  local exit=$?

  local _black
  local _red
  local _green
  local _yellow
  local _blue
  local _magenta
  local _cyan
  local _white
  local _bold
  local _blink
  local _reset

  if [[ ${__colorize_prompt} ]] ; then
    export GIT_PS1_SHOWCOLORHINTS=1

    _black="\[$(tput setaf 0)\]"
    _red="\[$(tput setaf 1)\]"
    _green="\[$(tput setaf 2)\]"
    _yellow="\[$(tput setaf 3)\]"
    _blue="\[$(tput setaf 4)\]"
    _magenta="\[$(tput setaf 5)\]"
    _cyan="\[$(tput setaf 6)\]"
    _white="\[$(tput setaf 7)\]"
    _bold="\[$(tput bold)\]"
    _blink="\[$(tput blink)\]"
    _reset="\[$(tput sgr0)\]"
  else
    unset GIT_PS1_SHOWCOLORHINTS
  fi

  # {{{ Set up pre_ps1
  local ssh_icon=''   # Icon for ssh connection
  local local_icon='' # Icon for local connection
  local child_icon='' # Icon for child shell

  # If root, use upper-case letter
  # Also bold red (for ssh/local icon) and bold yellow (for child icon)
  if [[ ${EUID} -eq 0 ]] ; then
    ssh_icon+="${_bold}${_red}Σ"
    local_icon+="${_bold}${_red}Λ"
    child_icon+="${_bold}${_yellow}Β"
  else
    ssh_icon+="${_cyan}σ"
    local_icon+="${_green}λ"
    child_icon+="${_yellow}β"
  fi

  ssh_icon+="${_reset} "
  local_icon+="${_reset} "
  child_icon+="${_reset} "

  local ssh_ps1
  local child_ps1

  ssh_ps1=$(__ssh_ps1  "${ssh_icon}" "${local_icon}")
  child_ps1=$(__child_ps1 "${child_icon}")

  local pre_ps1="${ssh_ps1}${child_ps1}"

  # If root, only use bold <hostname>:
  # Otherwise, use <user>@<hostname>:
  if [[ ${EUID} -eq 0 ]] ; then
    pre_ps1+="${_bold}\h${_reset}:"
  else
    pre_ps1+="\u@\h:"
  fi

  pre_ps1+="${_bold}${_blue}\W${_reset}" # Add the current directory
  # }}}

  # {{{ Set up post_ps1
  local post_ps1
  post_ps1=''

  # If nonzero exit code, display it in red
  if [[ ${exit} -ne 0 ]] ; then
    post_ps1+="${_red}[${exit}]${_reset}"
  fi

  post_ps1+=' '
  # }}}

  __git_ps1 "${pre_ps1}" "${post_ps1}" '(%s)'
}
# }}}

export PROMPT_COMMAND=__set_ps1

# vim: fdm=marker ft=bash
