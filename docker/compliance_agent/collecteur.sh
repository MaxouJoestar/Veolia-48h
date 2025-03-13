#!/bin/bash

# Collecter des informations système
HOSTNAME=$(hostname)
OS_VERSION=$(cat /etc/debian_version)
LAST_UPDATE=$(date -r /var/lib/apt/periodic/update-success-stamp +"%Y-%m-%d %H:%M:%S")

# Vérification des comptes utilisateurs et politique de mot de passe
USERS=$(awk -F: '{ print $1 }' /etc/passwd)
ADMINS=$(grep '^sudo:.*$' /etc/group | cut -d: -f4)

# Création du JSON pour l'envoi
JSON_DATA=$(cat <<EOF
{
  "hostname": "$HOSTNAME",
  "os_version": "$OS_VERSION",
  "last_update": "$LAST_UPDATE",
  "users": "$USERS",
  "admins": "$ADMINS"
}
EOF
)

# Envoi des données au serveur OCI
curl -X POST -H "Content-Type: application/json" -d "$JSON_DATA" "https://10.0.5.42:443/api/compliance"