FROM debian:12.9

# Installer curl et autres utilitaires
RUN apt update && apt install -y curl

# Copier le script de conformité
COPY collecteur.sh /usr/local/bin/collecteur.sh
RUN chmod +x /usr/local/bin/collecteur.sh

# Planifier le script d'exécution
RUN echo "0 0 * * * root /usr/local/bin/collecteur.sh" >> /etc/crontab

CMD ["/bin/bash"]