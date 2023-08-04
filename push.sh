#!/bin/bash

folder=".git"
if [ -d $folder ]; then
  echo "find repository"
  git add . && git commit  -m "routine update" && git push origin master
fi
