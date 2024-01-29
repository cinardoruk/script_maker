#!/bin/zsh

:<<COMMENT
# idiomatic parameter and option handling in sh
TODO
* give use the option to create a global scripts file AND add it to path
* detect whether such a directory exists, prompt user to create it first time -g option is chosen
* create an index of scripts inside global_script_path. each script's top comment section is copied. turning this script into a script management tool as well.
*install newScript.sh itself into the global_scripts path
*make -l the default option?

COMMENT

# global script path
dest="$HOME/Scripts/"

# usage message to be displayed if user calls script incorrectly
usage="Usage: $0 [-l | -g] <script_name>
Creates script_name.sh and gives it execute permission
-l : create script_name.sh in current working dir
-g : create script_name.sh in a pre-determined dir, which is included in \$PATH
edit the variable dest at the beginning of the script to choose this directory
and add it to your \$PATH"

# in all valid calls to the script, there are two arguments,
# the first is -l | -g, the second is a script name
# if some other number of arguments were provided, exit
if [ $# -ne 2 ]; then
    echo "$usage"
    exit 1
fi


# some variables to contain boilerplate text for new scripts

shebang="#!$SHELL"
description='<<COMMENT
Optional description of script.
TODO
* task
COMMENT'

# functions for making local or global scripts
# functions can call variables that were declared outside

function local_script {

	echo "Creating local script."

	filename="$1.sh"

	echo $shebang > $filename
	echo $description >> $filename

	chmod u+x $filename

	$EDITOR $filename
}

function global_script {

	echo "Creating global script."

	filename="$1.sh"

	#use the dest var that was determined all the way at the top
	dest="$dest"/"$filename"

	echo $shebang > $dest
	echo $description >> $dest
	chmod u+x $dest

	$EDITOR $dest
}

# select action for provided flag
case "$1" in
	-l)
		echo "option 1"
		local_script $2
		exit 0
		;;
        -g)
		echo "option 2"
		global_script $2
		exit 0
		;;
        *)
		echo $usage
		exit 1
		;;
esac
