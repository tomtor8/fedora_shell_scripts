#!/bin/bash

# check internet connection
if wget -q --spider https://google.com; then
	if [ "$#" -eq 0 ]; then
		rclone sync /home/tom/Documents/Obsidian/ gdrive:Obsidian/ -v --exclude='.obsidian/**'
		exit
	fi
	while getopts ':clw' OPTION; do
		case "$OPTION" in
		c)
			rclone sync /home/tom/Documents/Obsidian/ComTech/ gdrive:Obsidian/ComTech/ -v --exclude='.obsidian/**'
			;;
		l)
			rclone sync /home/tom/Documents/Obsidian/Learning/ gdrive:Obsidian/Learning/ -v --exclude='.obsidian/**'
			;;
		w)
			rclone sync /home/tom/Documents/Obsidian/Work/ gdrive:Obsidian/Work/ -v --exclude='.obsidian/**'
			;;
		*)
			echo "Usage: $(basename "$0") [-c] for ComTech [-l] for Learning [-w] for Work."
			echo "The command can be used without options for syncing the whole Obsidian directory."
			;;
		esac
	done
else
	echo "Check your internet connection! Aborting sync."
	exit
fi
