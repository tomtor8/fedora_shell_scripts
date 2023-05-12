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
	result=$(fd "$name" "$item")
	if [[ "$result" != "" ]]; then
		counter=$((counter + 1))
		echo "$counter - $name is located here: $result"
	fi
done

if [[ $counter -eq 0 ]]; then
	echo "The file $name is NOT in PATH!"
fi

IFS="$OLD_IFS"
