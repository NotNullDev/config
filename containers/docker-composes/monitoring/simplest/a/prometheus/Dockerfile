FROM prom/prometheus:v2.40.3

# RUN set -x && \
#     apk add --update $RUNTIME_DEPS && \
#     apk add --virtual build_deps $BUILD_DEPS &&  \
#     cp /usr/bin/envsubst /usr/local/bin/envsubst && \
#     apk del build_deps

ADD prometheus.yml /etc/prometheus/

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]