#!/bin/bash

param="$1"

# testing if parameters are empty
if [[ -z "$param" ]]
then
  echo "Please provide a parameter (login, webpage...)!"
  exit 1
fi

# testing the number of parameters
# if more than one, exit with error
if [[ "$#" -gt 1 ]]
then
  echo "Please provide only one parameter (login, webpage...)!"
  exit 1
fi
# get the password and copy it to the system clipboard
bw get password "$param" | wl-copy

