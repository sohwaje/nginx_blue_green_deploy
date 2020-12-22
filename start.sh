#!/bin/sh

# function check
if [[ ! -x blue_green_fnc.sh ]]
then
  chmod +x blue_green_fnc.sh
fi

# include function
. ./blue_green_fnc.sh

sh run_new_was.sh && sleep 60 && sh health_check.sh && sleep 60 && sh switch.sh
