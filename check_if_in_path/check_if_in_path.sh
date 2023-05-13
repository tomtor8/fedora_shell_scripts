#!/bin/bash

read -r -p "File name? " name
pathfolders="$PATH"
counter=0
OLD_IFS="$IFS"
# internal field separator changed to colon
IFS=:
# cycle through the items in PATH variable
# items are separated by colons
for item in $pathfolders; do
	# {/} prints the basename of the found file path
	result=$(fd "$name" "$item" -x echo "{/}")
	if [[ "$result" != "" ]]; then
		counter=$((counter + 1))
		message="$counter - $name is located here: $item, with the result(s):"
		# get the length of the message
		messlen=${#message}
		echo "$message"
		# create a divider the length of the message
		for ((i = 0; i < messlen; i++)); do
			echo -n "="
		done
		echo
		IFS=$'\n'
		for basename in $result; do
			echo "  $basename"
			# if you want to offset the results by a width of a tab
			# printf "\t%s\n" "$basename"
		done
		echo
	fi
done

if [[ $counter -eq 0 ]]; then
	echo "The file $name is NOT in PATH!"
fi

IFS="$OLD_IFS"
