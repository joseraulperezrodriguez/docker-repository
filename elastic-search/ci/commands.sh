# build the image
docker build -t elastic-search-ci:basic --no-cache .

# run the image
docker run -dit  --name elastic-search-ci-basic-container elastic-search-ci:basic

# enter container
docker exec -it elastic-search-ci-basic-container bash


