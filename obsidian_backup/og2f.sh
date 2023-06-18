#!/bin/bash

# check internet connection
if wget -q --spider https://google.com; then
	if [ "$#" -eq 0 ]; then
		rclone sync gdrive:Obsidian/ /home/tom/Documents/Obsidian/ -v --exclude='.obsidian/**'
		exit
	fi
	while getopts ':clw' OPTION; do
		case "$OPTION" in
		c)
			rclone sync gdrive:Obsidian/ComTech/ /home/tom/Documents/Obsidian/ComTech/ -v --exclude='.obsidian/**'
			;;
		l)
			rclone sync gdrive:Obsidian/Learning/ /home/tom/Documents/Obsidian/Learning/ -v --exclude='.obsidian/**'
			;;
		w)
			rclone sync gdrive:Obsidian/Work/ /home/tom/Documents/Obsidian/Work/ -v --exclude='.obsidian/**'
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
