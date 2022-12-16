# File: .bash-prompt.sh

source ~/.git-prompt.sh # Needed for git repo status

export GIT_PS1_SHOWDIRTYSTATE=1      # '*'=unstaged, '+'=staged
export GIT_PS1_SHOWSTASHSTATE=1      # '$'=stashed
export GIT_PS1_SHOWUNTRACKEDFILES=1  # '%'=untracked
export GIT_PS1_STATESEPARATOR="" # No space between branch and index status

# {{{ __color_enabled
# Check if the terminal supports colors
function __color_enabled() {
  local -i colors=$(tput colors 2> /dev/null)
  [[ $? -eq 0 ]] && [[ ${colors} -gt 2 ]]
}
# }}}

# Whether to use colors in the prompt
unset __colorize_prompt && __color_enabled && __colorize_prompt=1

# {{{ __ssh_ps1
# Check if this bash instance is running in an ssh connection.
# Depending on this, the icon printed will be different.
function __ssh_ps1() {
  local exit=$?
  local ssh_icon="s"
  local local_icon=""
  local ssh_format="%s"
  local local_format="%s"

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
  local child_icon="b"
  local child_format="%s"

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
function __set_ps1() {
  local exit=$?

  local _black='\[$(tput setaf 0)\]'
  local _red='\[$(tput setaf 1)\]'
  local _green='\[$(tput setaf 2)\]'
  local _yellow='\[$(tput setaf 3)\]'
  local _blue='\[$(tput setaf 4)\]'
  local _magenta='\[$(tput setaf 5)\]'
  local _cyan='\[$(tput setaf 6)\]'
  local _white='\[$(tput setaf 7)\]'
  local _bold='\[$(tput bold)\]'
  local _reset='\[$(tput sgr0)\]'

  if [[ ${__colorize_prompt} ]] ; then
    export GIT_PS1_SHOWCOLORHINTS=1
  else
    unset GIT_PS1_SHOWCOLORHINTS

    _black=""
    _red=""
    _green=""
    _yellow=""
    _blue=""
    _magenta=""
    _cyan=""
    _white=""
    _bold=""
    _reset=""
  fi

  # {{{ Set up pre_ps1
  local ssh_format="${_cyan}%s${_reset}"     # Format for ssh connection
  local local_format="${_green}%s${_reset}"  # Format for local connection
  local child_format="${_yellow}%s${_reset}" # Format for child shell

  local ssh_icon="σ "   # Icon for ssh connection
  local local_icon="λ " # Icon for local connection
  local child_icon="β " # Icon for child shell

  # If root, use upper-case letter
  # Also bold red (for ssh/local icon) and bold yellow (for child icon)
  if [[ ${EUID} -eq 0 ]] ; then
    ssh_format="${_bold}${_red}%s${_reset}"
    local_format="${_bold}${_red}%s${_reset}"
    child_format="${_bold}${_yellow}%s${_reset}"

    ssh_icon="Σ "
    local_icon="Λ "
    child_icon="Β "
  fi

  local ssh_ps1=$(__ssh_ps1  "${ssh_icon}" "${local_icon}" "${ssh_format}" "${local_format}")
  local child_ps1=$(__child_ps1 "${child_icon}" "${child_format}")

  local pre_ps1="${ssh_ps1}${child_ps1}"

  # If root, only use bold hostname
  # Otherwise, use <user>@<hostname>
  if [[ ${EUID} -eq 0 ]] ; then
    pre_ps1+="${_bold}\h${_reset}:"
  else
    pre_ps1+="\u@\h:"
  fi

  pre_ps1+="${_bold}${_blue}\W${_reset}" # Add the current directory
  # }}}

  # {{{ Set up post_ps1
  local post_ps1=""

  # If nonzero exit code, display it in red
  if [[ ${exit} -ne 0 ]] ; then
    post_ps1+="${_red}[${exit}]${_reset}"
  fi

  post_ps1+=" "
  # }}}

  __git_ps1 "${pre_ps1}" "${post_ps1}" "(%s)"
}
# }}}

export PROMPT_COMMAND=__set_ps1

# vim: fdm=marker
