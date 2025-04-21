#!/bin/bash

if [ $# -eq 0 ];then
    echo "No file passed as argument while calling this script"
    echo "Uasge: $0 <file>"
    exit 1
fi

logfile="$1"

function readLogs {
    if [ -f "$logfile" ];then
        grep -E "Vin [0-9]+.*Model_Year=[0-9]{4}.*Suffix=[a-zA-Z]{2}" "$logfile" | \
        sed -nE 's/.*Vin ([0-9]+).*Model_Year=([0-9]{4}).*Suffix=([a-zA-Z]{2}).*/Vin=\1 Model_Year=\2 Suffix=\3/p'
    fi
}