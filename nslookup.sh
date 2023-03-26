#!/bin/bash 
# Program name: pingall.sh 
cat list.txt | while read output 
do  
	nslookup "$output" >> output_list.txt
	echo "_____________________________________" >> output_list.txt
done