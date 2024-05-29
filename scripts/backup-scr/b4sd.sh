#!/usr/bin/env bash

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

git_bkp() {
	pushd "$1" || exit 1
    git pull &&
	notify-send "$1" "updating.." -i "$MY_FOLDER"/library/icons/git.png
	if git add . && git commit -m "Update $(date +'%d-%m-%y')"; then
		if git push 2> /dev/null; then
			notify-send "$1 updated" ":)" -i "$MY_FOLDER"/library/icons/success.png
		else
			notify-send "Could not push" "$1" -i "$MY_FOLDER"/library/icons/error.png
		fi
	else
		notify-send "Nothing to backup" "$1" -i "$MY_FOLDER"/library/icons/info.png
	fi
	popd || exit 1
}

pass git pull
pass git push
git_bkp /home/canus
#git_bkp /home/contre/.newsboat
#git_bkp /.newsboat 2&> xargs -I {} "notify-send "Error" "{}" -i "$MY_FOLDER"/library/icons/error.png"
