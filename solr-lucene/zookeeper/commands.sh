# build the image
docker build -t zookeeper:basic --no-cache .

# run the image
docker run -it  --name zookeeper-basic-container -p 0.0.0.0:2181:2181 -p 0.0.0.0:2888:2888 -p 0.0.0.0:3888:3888 zookeeper:basic

# enter container
docker exec -it zookeeper-basic-container bash

# creating a network
docker network create --driver=bridge --subnet=172.28.0.0/16 --ip-range=172.28.5.0/24 --gateway=172.28.5.254 docker-local
