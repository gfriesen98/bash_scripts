#!/bin/bash

while getopts l:d: option; do
	case $option in
		l)
			LINK=$OPTARG ;;
		d)
			DIR=$OPTARG ;;
	esac
done

if [ -z ${LINK+x} ]; then
	echo "LINK IS REQUIRED!";
	exit 1
fi

if [ -z ${DIR+x} ]; then
	echo "DIRECTORY IS REQUIRED!";
	exit 1
fi


mega-get -q $LINK $DIR 

bash megawatch.sh