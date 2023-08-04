#!/bin/bash

folder=".git"
Log="log.txt"
if [ $# == 1 ]; then
    if [ -d $folder ]; then 
        echo "> find repository"
        time3=$(date "+%Y-%m-%d %H:%M:%S")
        echo "> ($time3)pushing to origin master ..."
        if [ ! -f $Log ]; then
            touch $Log
            chmod +x $Log
            echo "> Success create $Log"
            ehco -e "---log create---" >> $Log
        fi
        echo -e "$time3 -> log: $*" >> $Log
        git add . && git commit  -m "$*" && git push origin master
    fi
else
    echo "> Error: short of parameter"
    echo "  Usage: ./push Description"
    echo "  \"Description\" could be the brief of this push or any thing you want"
fi
