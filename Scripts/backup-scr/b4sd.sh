#!/bin/bash

git_bkp() {
	pushd "$1" || exit 1
	notify-send "$1" "updating.." -i "$MY_FOLDER"/Library/icons/git.png
	if git add . && git commit -m "Update $(date +'%d-%m-%y')"; then
      sleep 1 &&
		git push 2> ~/tmp.log > ~/tmp.log &&
			notify-send "$1 updated" ":)" -i "$MY_FOLDER"/Library/icons/success.png
	else
		notify-send "Nothing to backup" "$1" -i "$MY_FOLDER"/Library/icons/info.png
		exit 0
	fi
	popd || exit 1
}

git_bkp /home/canus
git_bkp /home/contre/.newsboat
#git_bkp /.newsboat 2&> xargs -I {} "notify-send "Error" "{}" -i "$MY_FOLDER"/Library/icons/error.png"
