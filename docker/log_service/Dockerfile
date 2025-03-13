FROM debian:12.9

# Installer les dépendances nécessaires pour syslog et Graylog
RUN apt update && apt install -y rsyslog curl gnupg

# Configuration du serveur Syslog
COPY rsyslog.conf /etc/rsyslog.conf
COPY graylog.conf /etc/graylog.conf

# Exposer les ports nécessaires
EXPOSE 514/udp
EXPOSE 8514

CMD ["rsyslogd", "-n"]