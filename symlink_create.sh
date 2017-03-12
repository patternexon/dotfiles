#!/bin/bash

filename="symlink.list"

pwd=`pwd`
printf "The pwd is $pwd\nAnd the symlink list is in $filename\n"
while IFS='' read -r line || [[ -n "$line" ]]; do
	#echo $line
	link_name=$(echo $line | cut -d, -f1)
	source=$(echo $line | cut -d, -f2)
	printf "$link_name should point to $source\n"
	if [ -e "$link_name" ]
	then
		printf "$link_name exists already\n"
		mv $link_name $link_name.date + "%Y%m%d%H%M%S"
		printf "$link_name backed up\n"
	else
		symlink_cmd="ln -sf $pwd/$source $link_name"
		printf "Running $symlink_cmd\n"
		eval $symlink_cmd

	fi
done < "$filename"	
