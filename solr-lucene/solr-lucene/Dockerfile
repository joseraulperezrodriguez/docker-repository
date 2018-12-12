FROM java:8-jdk

ENV DCK_BASE=/docker
ENV SOLR_USER="solr"
ARG DCK_VOLUME="$DCK_BASE/volumes"
ARG SOLR_VERSION=7.5.0
ARG SOLR_NAME="solr-$SOLR_VERSION"
ARG SOLR_SERVICE="solr"
ARG SOLR_PORT=8983

ENV SOLR_DIR="$DCK_BASE/$SOLR_NAME"
ENV SOLR_DATA="$DCK_VOLUME/$SOLR_NAME"
ENV SOLR_LOG="$SOLR_DATA/logs"

ENV SOLR_INCLUDE="/etc/default/"$SOLR_SERVICE".in.sh"

RUN mkdir "$DCK_BASE"
RUN mkdir "$DCK_VOLUME"

RUN set -ex
RUN useradd -ms /bin/bash "$SOLR_USER"
RUN chown -R "$SOLR_USER:$SOLR_USER" "$DCK_BASE"

RUN wget -q "https://www-eu.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR_NAME.tgz"
RUN tar -zxf "$SOLR_NAME.tgz"
RUN mv "$SOLR_NAME" "$SOLR_DIR"
WORKDIR "$SOLR_DIR"
RUN mkdir "$SOLR_DATA"
RUN mkdir "$SOLR_LOG"
RUN chown -R "$SOLR_USER:$SOLR_USER" "$DCK_BASE"
RUN ["chmod", "+x", "bin/install_solr_service.sh"]
RUN mkdir "$DCK_BASE/installation"
RUN bash "bin/install_solr_service.sh" "/$SOLR_NAME.tgz" -n -i "$DCK_BASE/installation" -d "$SOLR_DATA" -u "$SOLR_USER" -s "$SOLR_SERVICE" -p "$SOLR_PORT"

#RUN echo "SOLR_PID_DIR=$SOLR_DATA" >> "$SOLR_INCLUDE"
#RUN echo "SOLR_HOME=$SOLR_DATA/data" >> "$SOLR_INCLUDE"

#RUN echo "LOG4J_PROPS=$SOLR_DATA/log4j2.xml" >> "$SOLR_INCLUDE"
#RUN echo "SOLR_LOGS_DIR=$SOLR_LOG" >> "$SOLR_INCLUDE"

VOLUME ["$SOLR_DATA"]

EXPOSE "$SOLR_PORT"

COPY launch-solr.sh "$DCK_BASE/"

RUN ["chmod", "+x", "/docker/launch-solr.sh"]

ENTRYPOINT ["/docker/launch-solr.sh"]
#CMD ["tail", "-500f", "/docker/launch-solr.sh"]

# CMD cat

#ENTRYPOINT ["/docker/launch-solr.sh"]
#CMD ["solr", "start-foreground"]

#ENV PATH=$PATH:/$ZK_DIR/bin \
#    ZOOCFGDIR=$ZK_CONF_DIR
#RUN ["chmod", "+x", "/docker/launch-zk.sh"]

#ENTRYPOINT ["/docker/launch-zk.sh"]
#CMD ["/bin/bash"]


#wget -q https://www-eu.apache.org/dist/lucene/solr/7.5.0/solr-7.5.0.tgz

# default binaries folders; using -i argument in installation command can change the default folder
#/opt/solr-7.5.0
#/opt/solr -> /opt/solr-7.5.0

# default data folder; using  -d argument in installation command
#/var/solr

# create solr user

# extract the file
#tar xzf solr-7.5.0.tgz --strip-components=2


# installation script example
#sudo bash ./install_solr_service.sh solr-7.5.0.tgz -i /opt -d /var/solr -u solr -s solr -p 8983

# copy solr.xml to default home directory /var/solr/data


# default "include" file 
#/etc/default/solr.in.sh

# setup the following variables
#SOLR_PID_DIR=/var/solr
#SOLR_HOME=/var/solr/data


# setup log directory
#LOG4J_PROPS=/var/solr/log4j2.xml
#SOLR_LOGS_DIR=/var/solr/logs

# set the zookeeper folder in include file
########################################### ZK_HOST needs to be configured later at run time
#ZK_HOST=z1:2181/solr

# set the solr hostname
########################################### SOLR_HOST needs to be configured later at run time
#SOLR_HOST=solr.example.com



