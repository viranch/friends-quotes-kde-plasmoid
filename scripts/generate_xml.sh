#!/bin/sh

path=$(echo $0 | sed "s/$(basename $0)//g")..
python $path/scripts/parse.py $path/friends.html $path/contents/ui/friends.xml
echo
echo ":: friends.xml generated and placed in contents/ui/friends.xml"
echo
