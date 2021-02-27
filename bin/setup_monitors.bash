#!/bin/bash

external_monitor=''

hwinfo=$(hwinfo --monitor --short)

echo ${hwinfo} | grep 'DELL P2415Q' > /dev/null
if [[ $? == 0 ]];then
    external_monitor='DELL'
fi
echo ${hwinfo} | grep 'LG ELECTRONICS LG Ultra HD' > /dev/null
if [[ $? == 0 ]];then
    external_monitor='LG'
fi

case ${external_monitor} in
    LG)
        4k_monitor_setup.sh l
        ;;
    DELL)
        4k_monitor_setup.sh v
        ;;
    *)
        4k_monitor_setup.sh 1k
esac
