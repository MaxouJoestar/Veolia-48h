# VEOLIA-VCH

Ce projet permet de déployer rapidement un ensemble de services Docker (NTP, logs, compliance, proxy, et optionnellement Grafana) sur une machine distante sous Debian 12.9.0.

## Prérequis

- Une machine A (machine de contrôle) avec accès SSH à la machine B (machine cible).
- La machine B doit être sous Debian 12.9.0 et avoir une adresse IP dans le réseau `10.0.0.0/24`.
- Un utilisateur avec des privilèges `sudo` sur la machine B.

## Utilisation

1. Clonez ce dépôt sur la machine A :
   git clone https://github.com/votre-utilisateur/votre-repository.git
   cd votre-repository
   
Exécutez le script de déploiement :

./deploy.sh
Le script vous demandera l'adresse IP de la machine B (par exemple, 10.0.0.2).

Vérifiez que les conteneurs Docker sont en cours d'exécution :

ssh -p 2222 user@10.0.0.2 docker ps
Configuration SSH
Le script configure SSH pour :

Écouter sur le port 2222.

Désactiver l'authentification par mot de passe (seules les clés SSH sont autorisées).

Pour vous connecter à la machine B après le déploiement :

ssh -p 2222 user@10.0.0.2
