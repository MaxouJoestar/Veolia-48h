FROM debian:12.9-stable

# Installer Squid Proxy et les outils nécessaires
RUN apt update && apt install -y squid apache2-utils curl

# Configuration de Squid
COPY squid.conf /etc/squid/squid.conf
COPY proxy_admin.sh /usr/local/bin/proxy_admin.sh
RUN chmod +x /usr/local/bin/proxy_admin.sh

# Exposer les ports nécessaires
EXPOSE 8080 8530 53

CMD ["squid", "-NYC"]