# creating a network
docker network create --driver=bridge --subnet=172.28.0.0/16 --ip-range=172.28.5.0/24 --gateway=172.28.5.254 docker-local

# creating stack 
docker stack deploy -c docker-compose.yml solr-zookeeper-system
