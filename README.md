# VEOLIA-VCH

Ce projet configure et déploie une infrastructure basée sur Docker pour surveiller et centraliser les logs à l'aide de **Loki**, **Promtail**, **Grafana**, et **HAProxy**. 

## Prérequis

- Docker et Docker Compose installés sur votre machine
- Clé SSH configurée pour une connexion sécurisée (mot de passe désactivé)

## Installation

1. **Cloner le dépôt :**
`git clone https://github.com/MaxouJoestar/Veolia-48h.git`

2. **Se rendre dans le dossier docker :**
`cd Veolia-48h/docker`

4. **Construire et démarrer les conteneurs Docker :**
`docker-compose build`
`docker-compose up -d`

5. **Configuration SSH**
Le port SSH est configuré dynamiquement en fonction du département (22<numero_departement>).
L'authentification par mot de passe est désactivée, et seule l'authentification par clé SSH est autorisée.

6. **Ports**
- Loki: 3100
- Grafana: 3000
- Syslog: 514
- HAProxy: 8080
