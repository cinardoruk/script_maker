#!/bin/zsh
<<COMMENT
# idiomatic parameter and option handling in sh
while test $# -gt 0
do
    case "$1" in
        --opt1) echo "option 1"
            ;;
        --opt2) echo "option 2"
            ;;
        --*) echo "bad option $1"
            ;;
        *) echo "argument $1"
            ;;
    esac
    shift
done

exit 0

TODO
* use the design above to fix script

COMMENT

set -x

#global and local flags

flag1="-l"
flag2="-g"

usage="Usage: $0 <-l | -g> script_name
Creates script_name.sh and gives it execute permission
-l : create script_name.sh in current dir
-g : create script_name.sh in home/user/Scripts, which is included in \$PATH"


# Check if any arguments were provided
if [ $# -eq 0 ]; then
    echo $usage
    exit 1
fi
#echo $1
# Parse the first argument to determine the flag
if [ $1 == "-l" ]; then
	flag1="true"
	shift # Shift the arguments to remove the first argument
elif [ $1 == "-g" ]; then
	flag2="true"
	shift
else
	echo $usage
	exit 1
fi


# some variables to contain boilerplate text for new scripts

shebang="#!$SHELL"
description='<<COMMENT
Optional description of script.
TODO list too keep track of tasks.
etc.
COMMENT'


# make new script according to selected flag
if [ "$flag1" == "true" ]; then
	echo "Creating local script."

	file="$1.sh"

	echo $shebang > $file
	echo $description >> $file

	chmod u+x $file

	$EDITOR $file

elif [ "$flag2" == "true" ]; then
	echo "Creating global script."

	file="$1.sh"
    	dest="$HOME/Scripts/$file"

    	echo $shebang > $dest
	echo $description >> $dest
	chmod u+x $dest

	$EDITOR $dest
else
	echo "something went very wrong"
	exit 1
fi
