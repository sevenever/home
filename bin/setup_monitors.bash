#!/bin/bash

num_monitors=$(xrandr --listmonitors | head -1 | cut -d ':' -f 2 | tr -d ' ')

if [[ "${num_monitors}" == "2" ]];then
    4k_monitor_setup.sh v
elif [[ "${num_monitors}" == "1" ]];then
    4k_monitor_setup.sh 1k
fi
