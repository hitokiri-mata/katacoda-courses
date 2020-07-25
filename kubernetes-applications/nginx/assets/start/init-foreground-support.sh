#!/bin/bash

FREQUENCY=1                                          # Delay between each check for completion
BACKGROUND_SIGNAL_FILE='/opt/.backgroundfinished'    # File updated by background to indicate completion
BACKGROUND_SAFE_WORD='done'                          # Word in BACKGROUND_SIGNAL_FILE indicating completion
START_MESSAGE='Starting scenario'                    # Message before the progress animation
END_NORMAL_MESSAGE='Scenario ready. You have a running Kubernetes cluster.'
END_KILLED_MESSAGE='Interupted. This scenario may still be initializing.'

source /usr/local/etc/init-progress.sh
show_progress &
progress_pid=$!

cleanup () {
  kill $progress_pid >/dev/null 2>&1
  progress_pid=-1
  end_message=$END_KILLED_MESSAGE
}

# Catch any exit and stop progress animation
trap cleanup SIGINT EXIT INT QUIT TERM

start_progress () {
  echo -n "$START_MESSAGE "

  # Periodically check for background signal or user Ctrl-C interuption
  end_message=$END_NORMAL_MESSAGE
  while [[ $progress_pid -ge 0 ]]; do
    grep -i ${BACKGROUND_SAFE_WORD} ${BACKGROUND_SIGNAL_FILE} &> /dev/null
    if [[ "$?" -eq 0 ]]; then
      kill $progress_pid >/dev/null 2>&1
      break
    fi
    sleep $FREQUENCY
  done

  echo -e "\033c" ; stty sane; setterm -reset; tput reset; clear
  printf "%s\n\n" "${end_message}"
}