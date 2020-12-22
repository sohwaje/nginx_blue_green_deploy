#!/bin/sh
# include script function
cd "$(dirname "$0")"
sh blue_green_fnc.sh
sh run_new_was.sh && sleep 60 && sh health_check.sh && sleep 60 && sh switch.sh
