#!/bin/bash

folder=".git"
if [ -d $folder ]; then 
  echo "> find repository"
  echo "> (${date})pushing to origin..."
  echo -e "${date} -> push log" >> log.txt
  git add . && git commit  -m "routine update" && git push origin master
fi
