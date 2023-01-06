#!/bin/bash

package="kicad-rename"
prev_name=''
new_name=''

while getopts 'p:n:h' flag; do
	case "${flag}" in
		p) prev_name="${OPTARG}" ;;
		n) new_name="${OPTARG}" ;;
		h) 
			echo "$package - Rename kicad project and directories."
			echo " "
			echo "$package [options] application [arguements]"
			echo " "
			echo "options:"
			echo "-h			Show help information."
			echo "-p	(required)	Previous KiCAD project name."
			echo "-n	(required)	New KiCAD project name."
			exit 0
			;;
	esac
done

if [${prev_name} == '']; then
	echo "Previous KiCAD project name not found. Exiting." 
	exit 0
fi

if [${new_name} == '']; then
	echo "New KiCAD project name not found. Exiting." 
	exit 0
fi

# Check that rename is installed
if !which rename &>/dev/null 
then
	echo "Missing package "rename". This package can be installed using brew."
	echo "Install: brew install rename"
	exit
fi

# Rename within files except zip files
sed -i '' "s/${prev_name}/${new_name}/g" *.*[!*.zip]

# Rename subdirectories
find . -name "${prev_name}*" | xargs -I{} rename "s/${prev_name}/${new_name}/" {}
