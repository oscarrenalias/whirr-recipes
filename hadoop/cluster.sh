#!/bin/sh
export CLASSPATH=$CLASSPATH:`pwd`/functions

if [ "$#" -lt 2 ]; then 
    echo "Error running script: $0 (start | stop) (ebs | instance)" 
	exit
fi

case "$1" in
	start)
		echo Starting $2 cluster...
		whirr launch-cluster --config hadoop-ec2-${2}.properties
		;;
	stop)
		echo Stopping $2 cluster...
		whirr destroy-cluster --config hadoop-ec2-${2}.properties
		;;
esac