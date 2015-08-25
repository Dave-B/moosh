#!/bin/bash -x
source functions.sh

install_db
install_data
cd $MOODLEDIR

if $MOOSHCMD course-list; then
  :
else
  exit 1
fi
if $MOOSHCMD course-list student; then
  exit 0
else
  exit 1
fi
