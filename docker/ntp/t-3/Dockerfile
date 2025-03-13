# Utiliser une image de base Debian
FROM debian:12.9

# Mise à jour des paquets et installation de ntp
RUN apt-get update && apt-get install -y ntp

# Désinstaller chrony s'il est présent
RUN apt-get remove -y chrony

# Copier votre fichier de configuration NTP personnalisé
COPY ntp.conf /etc/ntp.conf

# Exposer le port NTP (123)
EXPOSE 123/udp

# Démarrer ntpd pour la synchronisation de l'heure
CMD ["ntpd", "-g", "-c", "/etc/ntp.conf", "-p", "123"]

# Définir le fuseau horaire sur Paris
RUN apt-get update && apt-get install -y tzdata && \
    ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
