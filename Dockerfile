FROM ubuntu:22.04

MAINTAINER chris <christian.groeber@pixlmint.ch>

ENV DEBIAN_FRONTEND=noninteractive
RUN useradd -m -s /bin/bash mailsender

RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends openjdk-17-jdk-headless mailutils && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/postfix && \
    echo "relayhost = Postfix-Relay" >> /etc/postfix/main.cf

RUN mkdir /var/mail/mailsender && \
    chown -R mailsender:mail /var/mail/mailsender

COPY generate.sh /root/generate.sh

RUN chmod +x /root/generate.sh

WORKDIR /java

CMD ["/bin/bash", "-c", "/root/generate.sh"]