#!/bin/bash

# $1 is a function parameter passed into the function
function divider() {
	for ((i = 0; i < $1; i++)); do
		echo -n "="
	done
}

read -r -p "File name? " name
echo
pathfolders="$PATH"
counter=0
OLD_IFS="$IFS"
# internal field separator changed to colon
IFS=:
# cycle through the items in PATH variable
# items are separated by colons
for pathitem in $pathfolders; do
	# {/} prints the basename of the found file path
	result=$(fd "$name" "$pathitem" -x echo "{/}")
	if [[ "$result" != "" ]]; then
		counter=$((counter + 1))
		message="$counter - $name location:"
		# get the length of the message
		messlen=${#message}
		echo "$message"
		# create a divider the length of the message
		divider "$messlen"
		echo
		echo "  $pathitem"
		echo
		echo "  File name(s):"
		echo "  -------------"
		IFS=$'\n'
		for basename in $result; do
			echo "    $basename"
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
