#!/bin/bash
source functions.sh

install_db
install_data

cd $MOODLEDIR

$MOOSHCMD debug-on
if echo "SELECT * FROM mdl_config WHERE name='debug' AND value='0'" \
    | mysql -u "$DBUSER" -p"$DBPASSWORD" "$DBNAME" | grep "debug"; then
  exit 0
else
 exit 1
fi