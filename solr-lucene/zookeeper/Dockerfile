FROM java:8-jdk

ARG ZK_VERSION=zookeeper-3.4.13
ARG DCK_BASE_ARG=/docker
ARG ZK_VOLUME="$DCK_BASE_ARG/volumes"
ARG ZK_DIR="$DCK_BASE_ARG/$ZK_VERSION/"

ENV DCK_BASE="$DCK_BASE_ARG"

ENV ZK_USER=zookeeper
ENV ZK_CONF_DIR="$ZK_VOLUME/conf"
ENV ZK_DATA_DIR="$ZK_VOLUME/data"
ENV ZK_DATA_LOG_DIR="$ZK_VOLUME/datalog"
ENV ZK_LOG_DIR="$ZK_VOLUME/logs"
ENV ZK_PORT=2181


# add user and create zk folders
RUN set -ex; \
    useradd -ms /bin/bash "$ZK_USER"; \
    mkdir "$DCK_BASE" ; \	
    mkdir "$ZK_VOLUME" ; \	
    mkdir -p "$ZK_DATA_LOG_DIR" "$ZK_DATA_DIR" "$ZK_CONF_DIR" "$ZK_LOG_DIR"; \
    chown "$ZK_USER:$ZK_USER" "$ZK_DATA_LOG_DIR" "$ZK_DATA_DIR" "$ZK_CONF_DIR" "$ZK_LOG_DIR"


# download Zookeeper and uncompress file
RUN set -e
RUN wget -q "https://www.apache.org/dist/zookeeper/$ZK_VERSION/$ZK_VERSION.tar.gz"
RUN tar -zxf "$ZK_VERSION.tar.gz"
RUN mv "$ZK_VERSION/" "$ZK_DIR"
RUN mv "$ZK_DIR/conf/"* "$ZK_CONF_DIR/"
RUN rm "$ZK_VERSION.tar.gz"
RUN chown -R "$ZK_USER:$ZK_USER" "$ZK_DIR"

WORKDIR "$ZK_DIR"
VOLUME ["$ZK_DATA_DIR", "$ZK_DATA_LOG_DIR", "$ZK_LOG_DIR"]

EXPOSE $ZK_PORT 2888 3888

ENV PATH=$PATH:/$ZK_DIR/bin \
    ZOOCFGDIR=$ZK_CONF_DIR

COPY launch-zk.sh "$DCK_BASE/"

RUN ["chmod", "+x", "/docker/launch-zk.sh"]

ENTRYPOINT ["/docker/launch-zk.sh"]
CMD ["zkServer.sh", "start-foreground"]

