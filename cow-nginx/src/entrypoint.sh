#!/bin/sh
if [ -z "$1" ];then
	export PORT=8080
	echo $PORT
else
	export PORT="$1"
	echo $PORT
fi

npm start