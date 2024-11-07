FROM docker.io/eagleoutice/lithie-tx-full:latest

USER root

WORKDIR /root/data

ENTRYPOINT [ "make" ]