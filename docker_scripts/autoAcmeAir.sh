#!/bin/bash
echo "Auto RUN Acmeair containers"

if [ $# -eq 0 ]; then
	echo "***************** autoAcmeAir.sh Usage ******************"
	echo "******** -n 3 --> to build&run three Acmeair containers"
	echo "******** -r 3 --> to kill&rm three Acmeair containers"
	echo "********************************************************"
fi

while [ $# -gt 0 ]
do
	case $1 in
		-n|-N) 
			shift
			echo "building $1 Acmeair containers"
			num=$1
			port=31770
			for((i=1;i<=num;i++))
			do
				#mongo="mongo_00$i"
				acmeair_web="acmeair_web_00$i"
				#docker run -d -p $port:9080 --name $acmeair_web --link ${mongo}:mongo acmeair/web
				docker run -d -p $port:9080 --name $acmeair_web --link mongo_001:mongo acmeair/web
				((port++))
				#sleep 5
			done
			shift
		;;
		-r|-R)
			shift
			echo "killing $1 Acmeair containers"
			num=$1
			for((i=1;i<=num;i++))
			do
				acmeair_web="acmeair_web_00$i"
				docker kill $acmeair_web
				docker rm $acmeair_web
			done
			shift
		;;
	esac

done

docker ps
