FROM ubuntu:22.04

MAINTAINER Chris <christian.groeber@pixlmint.ch>

RUN apt update && apt upgrade -y && \
    apt install -y openjdk-17-jdk-headless

COPY generate.sh /root/generate.sh

RUN chmod +x /root/generate.sh

WORKDIR /java

CMD ["/bin/bash", "-c", "/root/generate.sh"]