# script_maker

Creates a bash script and gives it execute permission.

## Usage 

Usage: newScript.sh [-l | -g] <script_name>

Options:  
	-l : create script_name.sh in current working dir (local script)  
	-g : create script_name.sh in a pre-determined dir (global script). The dir should be included in $PATH
 
Arguments:  
	<script_name> Name of the file to be created. Don't include ".sh"
 
Notes:  
	To use -g, edit the variable dest at the beginning of the script to choose a directory
and add it to your \$PATH. This is usually done by adding this line

	export PATH="$PATH:/your/directory/path"  
 
to a config file your shell sources when you start it.
