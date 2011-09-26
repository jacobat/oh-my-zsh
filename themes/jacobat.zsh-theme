nocolor="%{$(echo -n '\e[0m')%}"
grey="%{$(echo -n '\e[0;30m')%}"
red="%{$(echo -n '\e[0;31m')%}"
green="%{$(echo -n '\e[0;32m')%}"
yellow="%{$(echo -n '\e[0;33m')%}"
blue="%{$(echo -n '\e[0;34m')%}"
magenta="%{$(echo -n '\e[0;35m')%}"
cyan="%{$(echo -n '\e[0;36m')%}"
white="%{$(echo -n '\e[0;37m')%}"

# get the name of the branch we are on
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "[%{$red%}${ref#refs/heads/}%{$reset_color%}] "
}


# PROMPT="$green%m %? $magenta%~ $nocolor%% $nocolor"
PROMPT="$green%m %? $magenta%20<...<%~%<< $nocolor%% $nocolor"

# RPROMPT="$cyan%*$nocolor"

precmd() {
  [[ -t 1 ]] || return
    case $TERM in
    *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%n@%m %~\a"
    ;;
  esac
}

autoload -U colors
colors
setopt prompt_subst
# PROMPT="$green%m %? $magenta%30<...<%~%<< $nocolor%% $nocolor"
RPROMPT='$(git_prompt_info)$cyan%*$nocolor'
