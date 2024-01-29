# script_maker
.sh that creates an .sh and gives it execute permission, for convenience

Usage: $0 <-l | -g> script_name
Creates script_name.sh and gives it execute permission
-l : create script_name.sh in current working dir
-g : create script_name.sh in a pre-determined dir, which is included in \$PATH
Edit the variable dest at the beginning of the script to choose this directory
and add it to your \$PATH
