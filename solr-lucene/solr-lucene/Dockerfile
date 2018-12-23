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

VOLUME ["$SOLR_DATA"]

EXPOSE "$SOLR_PORT"

COPY launch-solr.sh "$DCK_BASE/"

RUN ["chmod", "+x", "/docker/launch-solr.sh"]

ENTRYPOINT ["/docker/launch-solr.sh"]

