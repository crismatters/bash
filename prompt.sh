CHAR="\342\224\214\342\224\200"
BREAK="\342\224\224\342\224\200\342\224\200\342\225\274"
GREEN="\e[0;32m"
BLUE="\e[0;36m"
YELLOW="\e[0;33m"
NC="\e[01;37m"
RESET="\[\033[00m"
END="\e[0m"
RED="\e[0;91m"
COLOR=$RED
parse_git_branch() {
  git branch &> /dev/null
  if [ "$?" -eq "0" ]
  then
    echo -n "-(${NC}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' | tr -d '(' | tr -d ')')${COLOR})"
#  else
#    HOURS=$(date +%H)
#    MINS=$(date +%M)
#    if [ $HOURS -gt 12 ]
#    then
#      HOURS=$(($HOURS-12))
#      if [ $HOURS -lt 10 ]
#      then
#        HOURS="0${HOURS}"
#      fi
#      MINS="${MINS} PM"
#    else
#      MINS="${MINS} AM"
#    fi
#    echo -n "-(${NC}${HOURS}:${MINS}${COLOR})"
  fi
}
update_PS1(){
  if [[ ${EUID} == 0 ]]; then 
	  COLOR=$RED 
  else
	  COLOR=$BLUE
  fi
  
  export PS1="${COLOR}${CHAR}[${NC}\u${YELLOW}@${NC}\h${COLOR}]-[${GREEN}\W${COLOR}]$(parse_git_branch)\n${BREAK}${YELLOW}\$${RESET} "
}
shopt -u promptvars
PROMPT_COMMAND=update_PS1
