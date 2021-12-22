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
        return 1
}

git_bkp /home/canus && notify-send "Error" "Could not back up newsboat :(" -i "$MY_FOLDER"/Library/icons/error.png ;
git_bkp ~/.newsboat/ && notify-send "Error" "Could not back up newsboat :(" -i "$MY_FOLDER"/Library/icons/error.png
