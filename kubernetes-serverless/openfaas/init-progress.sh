#!/bin/bash
export LANG=en_US.UTF-32

SPINNER_COLOR_NUM=2                # Color to use, unless COLOR_CYCLE=1
SPINNER_COLOR_CYCLE=0              # 1 to rotate colors between each animation
SPINNER_STYLE="random"             # Set to random, to get a random stle, otherwise specity style name
SPINNER_NORMAL=$(tput sgr0)        # Reset encoding

# Handle signals
cleanup () {
  tput rc
  tput cnorm
  exit 0
}

# Catch any exit and reset cursor
trap cleanup SIGINT EXIT INT QUIT TERM
show_progress () {
  style=${SPINNER_STYLE}
  if [ "${style^^}" == "RANDOM" ]; then
    local spinners
    spinners=$(cat spinners.json | jq 'keys' | grep -v '\[' | grep -v '\]' | xargs)
    IFS=',' read -a spinnersArray <<< "$spinners"
  
    size=${#spinnersArray[@]}
    index=$((RANDOM % size))
    style=$(echo "${spinnersArray[$index]}" | xargs)
  fi
  
  set=$(cat spinners.json | jq ."${style}".frames | tr -d '\[' | tr -d '\]' | tr -d '\r\n' | sed -e 's/^[[:space:]]*//')
  interval=$(cat spinners.json | jq ."${style}".interval)
  interval=$(jq -n "${interval}"/1000)
  
  # Convert string to array
  IFS=',' read -a symbols <<< "$set"
  
  # Clean up each symbol
  for i in "${!symbols[@]}"; do
    c=${symbols[$i]}
    c=$(echo "${c}" | sed -e 's/^[ \t]*//' | tr -d '\"')
    symbols[$i]=${c}
  done
  while :; do
    tput civis
    for symbol in "${symbols[@]}"; do
      if [ $SPINNER_COLOR_CYCLE -eq 1 ]; then
        if [ $SPINNER_COLOR_NUM -eq 7 ]; then
          SPINNER_COLOR_NUM=1
        else
          SPINNER_COLOR_NUM=$((SPINNER_COLOR_NUM+1))
        fi
      fi
      local color
      color=$(tput setaf ${SPINNER_COLOR_NUM})
      tput sc
      printf "%s%s%s  " "${color}" "${symbol}" "${SPINNER_NORMAL}"
      tput rc
      sleep "${interval}"
    done
  done
  tput cnorm
  return 0
}
