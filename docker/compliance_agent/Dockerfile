FROM debian:12.9

# Installer curl et autres utilitaires
RUN apt update && apt install -y curl cron

# Copier le script de conformité dans /usr/local/bin/
COPY collecteur.sh /usr/local/bin/collecteur.sh
RUN chmod +x /usr/local/bin/collecteur.sh

# Planifier le script d'exécution avec cron
RUN echo "0 0 * * * root /usr/local/bin/collecteur.sh >> /var/log/collecteur.log 2>&1" >> /etc/crontab

# Démarrer cron en arrière-plan et maintenir le conteneur en vie
CMD ["sh", "-c", "cron && tail -f /dev/null"]