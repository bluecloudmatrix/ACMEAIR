#!/bin/bash
echo "Auto RUN mongodb containers"

if [ $# -eq 0 ]; then
	echo "***************** autoMongoDB.sh Usage ******************"
	echo "******** -n 3 --> to build&run three mongodb containers"
	echo "******** -r 3 --> to kill&rm three mongodb containers"
	echo "********************************************************"
fi

while [ $# -gt 0 ]
do
	case $1 in
		-n|-N) 
			shift
			echo "building $1 mongodb containers"
			num=$1
			for((i=1;i<=num;i++))
			do
				mongo="mongo_00$i"
				docker run --name $mongo -d -P mymongodb
				#docker run --name $mongo -d -P mymongodb --noprealloc --smallfiles
				sleep 5
			done
			shift
		;;
		-r|-R)
			shift
			echo "killing $1 mongodb containers"
			num=$1
			for((i=1;i<=num;i++))
			do
				mongo="mongo_00$i"
				docker kill $mongo
				docker rm $mongo
			done
			shift
		;;
	esac

done

docker ps
