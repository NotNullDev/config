FROM coredns/coredns

FROM ubuntu
COPY --from=0 /coredns /coredns
USER root

VOLUME [ "/etc/coredns" ]
COPY ./config /etc/coredns

ENTRYPOINT [ "/coredns" ]
CMD [ "-conf", "/etc/coredns/Corefile", "-p", "53" ]