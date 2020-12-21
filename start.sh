#!/bin/sh
sh run_new_was.sh && sleep 60 && sh health_check.sh && sleep 60 && sh switch.sh
