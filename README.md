# To Build Acmeair&MongoDB Containers

## Usage

> Note: after reboot, to start docker engine 
> you can choose to do this 
    # nohup docker -d &

Go to directory ./docker_scripts
First, to build mongodb containers

    # ./autoMongoDB.sh -n 40

Second, to build acmeair containers and link to mongodb containers

    # ./autoAcmeAir.sh -n 40

When all containers run successfully, JMeter can start to test via IP&port.

After testing, if want to clean all containers,

    # ./autoMongoDB.sh -r 40
    # ./autoAcmeAir.sh -r 40

Maybe you can go to the directory /var/lib/docker/volumes,
clean all volumes with  
    rm -rf *
violently


##To build mongoDB docker image <ubuntu>

    # cd Dockerfile_Directory

    # docker build -t="mymongodb" .

##To RUN mongoDB docker container <ubuntu>

    # docker run -d -P --name mongo_001 mymongodb



##To build ACMEAIR docker image <ubuntu>

    # docker build -t acmeair/web .

##To RUN ACMEAIR container & LINK to mongoDB container <ubuntu>

    # docker run -d -p 32770:9080 --name acmeair_web_001 --link mongo_001:mongo acmeair/web

##To set up JMeter & JMeter workload
[This link](https://github.com/acmeair/acmeair-driver/tree/master/acmeair-jmeter) helps to make it.

##To RUN JMeter
    # ./jmeter -n -t AcmeAir.jmx -j My_log.log -l My_result.jtl


##Etcd
    # /bin/etcd -version
