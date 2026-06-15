#!/bin/bash

#########################
##	   Setup Script    ##
#########################

# This script manually makes the required directories, folders and files for the script to run!
# by default this works under /usr/local/ and uses /usr/local/bin and /usr/local/share
# you can modify the name and install path using variables

program_name="Power Control"
install_path="/usr/local"

echo -e "install path is $(realpath $install_path)"
read -p "Are you sure you want to continue? [y/N]: " confirm
confirm=${confirm: -N}
if [[ $confirm =~ ^[Yy]$ ]]; then
	continue
else
	exit 1
fi
unset confirm

echo -e '\n' # creates two newlines
install_path=$(realpath $install_path)
bin_path=$(realpath $install_path/bin)
share_path=$(realpath $install_path/share)
echo "starting install..."
echo "starting checks..."
echo -e "checking the existance of the install path at \"$install_path\"..."
if [ ! -d $install_path ]; then
	read -p "$install_path doesn't exist. Should it be made? [y/N]: " confirm
	confirm=${confirm: -N}
	if [[ $confirm =~ ^[Yy]$ ]]; then
		echo "Making..."
		mkdir -p $install_path >/dev/null
		if [ $? -eq 0 ]; then
			echo "$install_path was made successfully"
		else
			echo "ERROR!!"
			echo -e "An error occurred while trying to make \"$install_path\""
			exit 1
		fi
	else
		exit 1
	fi
elif [ -d $install_path ]; then
	echo "$install_path exists"
else
	echo "ERROR!!"
	echo "This error should be impossible."
	echo "Be proud."
	echo "But seriously, somehow you managed to make your install path exist while the first check was running and not exist before the second check ran in order to display this message."
	echo "Well done!"
	exit 1
fi

echo -e "checking if \"$bin_path\" exists..."
if [ ! -d $bin_path ]; then
	echo "$bin_path doesn't exist. Creating it..."
	mkdir -p $bin_path 
	if [ $? -eq 0 ]; then
			echo "$bin_path was made successfully"
		else
			echo "ERROR!!"
			echo -e "An error occurred while trying to make \"$bin_path\""
			exit 1

# continue on making the rest of the things that need to be checked for, made, and move scripts from the user setup and default files to the share path

echo "$program_name was installed!"