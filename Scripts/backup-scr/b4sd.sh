#!/bin/bash

git_bkp() {
	pushd "$1" || exit 1
	git add . &&
	if git commit -m "Update $(date +'%d-%m-%y')"; then
      notify-send "$(git push)" &&
			notify-send "$1 updated" ":)" -i "$MY_FOLDER"/Library/icons/git.png
	else
		notify-send "Nothing to backup" "$1" -i "$MY_FOLDER"/Library/icons/git.png
		exit 0
	fi
	popd
}

git_bkp /home/canus &&
git_bkp ~/.newsboat 
#git_bkp /.newsboat 2&> xargs -I {} "notify-send "Error" "{}" -i "$MY_FOLDER"/Library/icons/error.png"
