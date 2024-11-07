FROM docker.io/eagleoutice/lithie-tx-full:latest

USER root

RUN chmod +x .github/workflows/dockerrun
WORKDIR /root/data

ENTRYPOINT [ ".github/workflows/dockerrun" ]