#!/bin/sh

dir="/home/jacob/.config/rofi/launchers/"
directories=($(ls -d $dir/*))
echo $directories
directory="${directories[$(( $RANDOM % 5 ))]}"
# ls $directory
"${directory}/launcher.sh" 
