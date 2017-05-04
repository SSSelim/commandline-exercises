#!/bin/bash

# a script to add new task to exercise file 

FILEPATH="./exercises"
newID=
task=

function get_new_id() {
  lastLine=$(tail -n 1 ${FILEPATH})  
  lastID=$(tail -n 1 ${FILEPATH} | cut -d"-" -f1)

  echo "Last ID : " $lastID
  
  newID=$(( lastID + 1))
  echo "New ID : " ${newID}
}

if [[ -z "$1" ]]; then
  echo "You forgot to tell me the task!"
  exit 
else 
  task=$1
fi

function add_new_task() {
  get_new_id
  line="    ${newID} - x - ${task}"
  echo "line to be added : " ${line}
  echo >> $FILEPATH
  echo ${line} >> $FILEPATH
}

add_new_task
