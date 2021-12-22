#!/bin/bash

# Update newsboatd
git_bkp() {
	pushd "$1" || exit 1
	git add . &&
		if git commit -m "Update $(date +"%d-%m-%y")"; then
			git push &&
				notify-send "$1 updated" ":)" -i "$MY_FOLDER"/Library/icons/git.png
		else
			notify-send "Nothing to backup" "$1" -i "$MY_FOLDER"/Library/icons/git.png
			exit 0
		fi
	exit 1
}

if ! git_bkp /home/canus; then
	notify-send "Error" "Could not back up newsboat :(" -i "$MY_FOLDER"/Library/icons/error.png
fi
if ! git_bkp ~/.newsboat/; then
  notify-send "Error" "Could not back up newsboat :(" -i "$MY_FOLDER"/Library/icons/error.png
fi