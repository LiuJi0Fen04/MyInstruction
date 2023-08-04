#!/bin/bash

folder=".git"
if [ -d $folder ]; then
  echo "> find repository"
  echo "> pushing to origin..."
  echo -e "push log" >> log.txt
  git add . && git commit  -m "routine update" && git push origin master
fi
