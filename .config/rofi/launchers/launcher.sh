#!/bin/sh

dir="/home/jacob/.config/rofi/launchers/"
# directories=($(ls -d $dir/* ))

directories=(misc colorful ribbon)

# echo $directories

directory="${directories[$(( $RANDOM % 4 ))]}"

echo "${directory}" 

"${dir}${directory}/launcher.sh" 
