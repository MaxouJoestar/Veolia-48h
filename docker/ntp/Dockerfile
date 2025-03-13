FROM debian:12.9

# Installer NTP
RUN apt update && apt install -y ntp

# Configuration NTP
COPY ntp.conf /etc/ntp.conf

# Exposer le port NTP (123)
EXPOSE 123/udp

CMD ["ntpd", "-g", "-c", "/etc/ntp.conf"]