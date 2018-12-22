FROM java:11-jdk

RUN mkdir "/docker"
RUN COPY launch-ci.sh "/docker/"

ENTRYPOINT ["/docker/launch-ci.sh"]