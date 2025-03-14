FROM debian:stable

RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/squid.conf

RUN mkdir -p /var/spool/squid && \
    chmod -R 755 /var/spool/squid && \
    chown -R proxy:proxy /var/spool/squid

EXPOSE 8080 8530 53

CMD ["squid", "-NYC"]