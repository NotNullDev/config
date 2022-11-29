FROM grafana/promtail:2.6.1

ADD promtail.yml /etc/promtail/

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
