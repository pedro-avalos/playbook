# File: .bash-prompt.sh

source ~/.git-prompt.sh # Needed for git repo status

export GIT_PS1_SHOWDIRTYSTATE=1 # '*'=unstaged, '+'=staged

# {{{ __color_enabled
# Check if the terminal supports colors
function __color_enabled() {
  local -i colors=$(tput colors 2> /dev/null)
  [[ $? -eq 0 ]] && [[ $colors -gt 2 ]]
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
  local lcl_icon=""
  local ssh_format="%s"
  local lcl_format="%s"

  case "$#" in
    0|1|2|3|4)
      ssh_icon="${1:-$ssh_icon}"
      lcl_icon="${2:-$lcl_icon}"
      ssh_format="${3:-$ssh_format}"
      lcl_format="${4:-$lcl_format}"
      ;;
    *) return $exit
  esac

  if [[ -n $SSH_CONNECTION ]] ; then
    printf -- "$ssh_format" "${ssh_icon}"
  else
    printf -- "$lcl_format" "${lcl_icon}"
  fi

  return $exit
}
# }}}

# {{{ __child_ps1
# Check if this bash instance is a child instance.
# Add an icon if it is a child.
function __child_ps1() {
  local exit=$?
  local icon="b"
  local printf_format="%s"

  case "$#" in
    0|1|2)
      icon="${1:-$icon}"
      printf_format="${2:-$printf_format}"
      ;;
    *) return $exit
  esac

  if [[ $SHLVL -gt 1 ]] ; then
    printf -- "$printf_format" "$icon"
  fi

  return $exit
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

  if [[ $__colorize_prompt ]] ; then
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
  local ssh_f="${_cyan}%s${_reset}"     # Format for ssh connection
  local local_f="${_green}%s${_reset}"  # Format for local connection
  local child_f="${_yellow}%s${_reset}" # Format for child shell

  local ssh_i="σ "   # Icon for ssh connection
  local local_i="λ " # Icon for local connection
  local child_i="β " # Icon for child shell

  # If root, use upper-case letter and bold
  if [[ ${EUID} -eq 0 ]] ; then
    ssh_f="${_bold}${_cyan}%s${_reset}"
    local_f="${_bold}${_green}%s${_reset}"
    child_f="${_bold}${_yellow}%s${_reset}"

    ssh_i="Σ "
    local_i="Λ "
    child_i="Β "
  fi

  local ssh_ps1=$(__ssh_ps1  "${ssh_i}" "${local_i}" "${ssh_f}" "${local_f}")
  local child_ps1=$(__child_ps1 "${child_i}" "${child_f}")

  local pre_ps1="${ssh_ps1}${child_ps1}"

  # If root, only use bold hostname
  # Otherwise, use <user>@<hostname>
  if [[ ${EUID} -eq 0 ]] ; then
    pre_ps1+="${_bold}\h${_reset}:"
  else
    pre_ps1+="\u@\h:"
  fi

  pre_ps1+="${_blue}\W${_reset}" # Add the current directory
  # }}}

  # {{{ Set up post_ps1
  local post_ps1=""

  # If nonzero exit code, display it in red
  if [[ ${exit} -ne 0 ]] ; then
    post_ps1+="${_red}[${exit}]${_reset}"
  fi

  if [[ ${EUID} -eq 0 ]] ; then
    post_ps1+="${_bold}${_red}"'\$ '"${_reset}"
  else
    post_ps1+='\$ '
  fi
  # }}}

  __git_ps1 "${pre_ps1}" "${post_ps1}" "(%s)"
}
# }}}

export PROMPT_COMMAND=__set_ps1

# vim: fdm=marker
