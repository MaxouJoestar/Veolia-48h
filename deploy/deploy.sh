#!/bin/bash

# Demander le nom de la machine
echo "Entrez le nom de la machine à attribuer :"
read machine_name

# Demander le département
echo "Entrez le département :"
read department

# Attribuer le nom à la machine
echo "Le nom de la machine est : $machine_name"

# Ouvrir le port 22[numéro de département] pour SSH
ssh_port="22$department"
echo "Ouverture du port SSH $ssh_port pour le département $department..."

# Modifier le fichier de configuration du pare-feu pour ouvrir le port
sudo ufw allow $ssh_port/tcp
sudo ufw reload

# Configurer SSH pour ne permettre que la connexion avec clé
echo "Configurer SSH pour ne permettre que la connexion avec une clé..."

# Assurez-vous que la clé publique de l'utilisateur est présente dans ~/.ssh/authorized_keys
echo "Ajoutez votre clé publique SSH dans ~/.ssh/authorized_keys si ce n'est pas déjà fait."

# Modifier la configuration SSH pour désactiver l'authentification par mot de passe
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Cloner le dépôt Git
echo "Clonage du dépôt Veolia-48h depuis GitHub..."
git clone https://github.com/MaxouJoestar/Veolia-48h.git

# Se rendre dans le dossier Docker
cd Veolia-48h/docker

# Exécuter les commandes Docker
echo "Construction et démarrage des conteneurs Docker..."
docker-compose build
docker-compose up -d

echo "Le script a terminé l'exécution avec succès !"
