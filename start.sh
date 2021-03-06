#!/bin/sh
cd "$(dirname "$0")"
# function check
if [[ ! -x blue_green_fnc.sh ]]
then
  chmod +x blue_green_fnc.sh
fi

# include function
. ./blue_green_fnc.sh

# start deploy
sh run_new_was.sh && sleep 60 && sh health_check.sh && sleep 60 && sh switch.sh
