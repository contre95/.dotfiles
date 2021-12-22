#!/bin/bash

# Update newsboatd
cd ~/.newsboat || exit
git add .
git commit -m "Update $(date +"%d-%m-%y")"
git push
