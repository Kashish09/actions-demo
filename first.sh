#!/bin/bash

if [ $# -eq 0 ];then
    echo "No file passed as argument while calling this script"
    echo "Uasge: $0 <file>"
    exit 1
fi

logfile="$1"

function readLogs {
    if [ -f "$logfile" ];then
        grep -e "Vin [0-9]+.*Model_Year=[0-9]{4}.*Suffix=[a-zA-Z]{2}.*" "$logfile" | \
        while read -r line;do
            echo "$line" | awk '{
            match($0, /Vin ([0-9]+).*Model_Year=[0-9]{4}.*Suffix=[a-zA-Z]{2}.*/, a);
            if (a[1]!= "" && a[2]!= "" && a[3]!= "")
                print "Vin= " a[1], "Model_Year=" a[2], "Suffix= " a[3];
            }'
        done
    fi
}