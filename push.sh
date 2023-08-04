#!/bin/bash

folder=".git"
if [ -d $folder ]; then
  echo "> find repository \n > pushing to origin..."
  git add . && git commit  -m "routine update" && git push origin master
fi
