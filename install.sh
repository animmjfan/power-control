#!/bin/bash

#########################
##	   Setup Script    ##
#########################

# This script manually makes the required directories, folders and files for the script to run!
# by default this works under /usr/local/ and uses /usr/local/bin and /usr/local/lib and under /usr/local/lib
# you can modify the name and path using variables
# credit is you and you can change the text that shows up with the credits to credit you (and me if you want) in any way you want (if you want) to say it!!

program_name='Power control'
credit=''
based_on='animmjfan'
install_path='/usr/local'
libary_folder='/usr/local/lib'
binary_folder='/usr/local/bin'
echo -e "install path is $(realpath $install_path)"
read -p "Are you sure you want to continue? [y/N]: " confirm
confirm=${confirm: -N}
if [[ $confirm =~ ^[Yy]$ ]]; then
	echo "Okay then!"
else
	exit 1
fi
unset confirm

echo -e '\n' # creates two newlines
install_path=$(realpath $install_path)
libary_folder=$(realpath $libary_folder)
binary_folder=$(realpath $binary_folder)
echo "starting install"
echo "starting checks"
echo "checking the existance of the install path at \"$install_path\""
if [ ! -d $install_path ]; then
	read -p "$install_path doesn't exist. Should it be made? [y/N]: " confirm
	confirm=${confirm: -N}
	if [[ $confirm =~ ^[Yy]$ ]]; then
		mkdir -p $install_path >/dev/null
		if [ $? -eq 0 ]; then
			echo "$install_path was made successfully"
		else
			echo "An error occurred while trying to make \"$install_path\""
			exit 1
		fi
	else
		exit 1
	fi
elif [ -d $install_path ]; then
	echo "$install_path already exists, skipping it"
else
	echo "This error should be impossible"
	echo "Be proud"
	exit 1
fi

# continue on making the rest of the things that need to be checked for, made, and move scripts from the user setup and default files to the libary folder

echo "$program_name was installed!"
