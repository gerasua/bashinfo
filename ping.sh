#!/bin/bash 
cat list.txt | while read output 
do 
	ping -c 2 "$output" > /dev/null 
	if [ $? -eq 0 ]; then 
	echo "$output" >> up.txt
	else echo "$output" >> down.txt
	fi 
done