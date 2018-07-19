#!/bin/bash

# initialize recursive and dryrun mode
maxdepth=3
dry=false

# read script arguments
for var in "$@"
do
	if [ "$var" = "-R" ] || [ "$var" = "--recursive" ]
	then
		maxdepth=1000000 # that should be deep enough :/
	fi
	
	if [ "$var" = "-D" ] || [ "$var" = "--dryrun" ]
	then
		dry=true
	fi
	
	if [ "$var" = "-h" ] || [ "$var" = "--help" ]
	then
		echo "usage: trashaux [-D | -R]"
		echo "       -D / --dryrun ..... list files to be deleted, don't actually delete"
		echo "       -R / --recursive .. delete (or list) files in all subdirectories"
		exit 1
	fi
done

# define recursive remove, based on parameters
function rrm() {
	find . -name "$1" -maxdepth $maxdepth | while read file
	do 
		echo "delete "$file""
		
		if [ "$dry" = "false" ]
		then
			rm $file
		fi
	done 
}

# delete files, potentially recursively
# quotation marks are required for find command
# extend with further patterns if required
rrm "*.log"
rrm "*.aux"
rrm "*.bbl"
rrm "*.blg"
rrm "*.log"
rrm "*.out"
rrm "*.idx"
rrm "*.sym"
rrm "*.toc"
rrm "*.brf"
rrm "*.ind"
rrm "*.ilg"
rrm "*.log"
rrm "*.acn"
rrm "*.flg"
rrm "*.glo"
rrm "*.idx"
rrm "*.ist"
rrm "*.lof"
rrm "*.maf"
rrm "*.mtc*"
rrm "*.syg"
rrm "*.synctex.gz"