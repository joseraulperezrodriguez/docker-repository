# build the image
docker build -t zookeeper:basic --no-cache .

# run the image
docker run -dit  --name zookeeper-basic-container -p 0.0.0.0:2181:2181 -p 0.0.0.0:2888:2888 -p 0.0.0.0:3888:3888 zookeeper:basic

# enter container
docker exec -it zookeeper-basic-container bash

