#!/bin/bash

temp=$(mktemp -t test.XXXXXX)
temp2=$(mktemp -t test2.XXXXXX)

function diskspace {
	df -k >"$temp"
	zenity --text-info \
		--filename="$temp" \
		--title="Disk info" \
    --width="1000" \
    --height="600"
}

function whoseon {
	who >"$temp"
	zenity --text-info \
		--filename="$temp" \
		--title="Name of the user" \
    --width="1000" \
    --height="600"
}

function memusage {
	echo "Fake memory usage data" >"$temp"
	zenity --text-info \
		--filename="$temp" \
		--title="Memory usage" \
    --width="1000" \
    --height="600"
}

while true; do
	zenity --list \
		--title="Menu" \
    --height="400" \
		--column="Opt" --column="Function" \
		1 "Display disk space" \
		2 "Display user" \
		3 "Display memory usage" \
		0 "Exit" \
		1>"$temp2"
	# check if the cancel button was clicked
	if [[ $? -eq 1 ]]; then
    echo "The process has been cancelled!"
		break
	fi
	# get the value of the selection stored in temporary file
	# the first column value is stored 1, 2, 3 or 0
	selection=$(cat "$temp2")

	case "$selection" in
	1)
		diskspace
		;;
	2)
		whoseon
		;;
	3)
		memusage
		;;
	0)
		break
		;;
	*)
		zenity --warning \
			--text="Sorry, invalid selection" \
			--title="Warning"
		;;
	esac
done

# remove temporary files
rm -f "$temp" 2>/dev/null
rm -f "$temp2" 2>/dev/null
