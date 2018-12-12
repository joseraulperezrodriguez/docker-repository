# build the image
docker build -t solr-cloud:basic --no-cache .

# run the image
docker run -dit  --name solr-cloud-basic-container solr-cloud:basic -p 0.0.0.0:8983:8983

# enter container
docker exec -it solr-basic-container bash


