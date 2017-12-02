#!/bin/bash
NUM_INSTANCES=`ps -ef | grep chrome | grep -v grep | wc -l`
if [ "${NUM_INSTANCES}" -lt 1 ]
then
    exec google-chrome
fi
