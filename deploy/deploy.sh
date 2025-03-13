#!/bin/bash

# Demander l'adresse IP de la machine B
read -p "Veuillez entrer l'adresse IP de la machine B (dans le réseau 10.0.0.0/24) : " MACHINE_B_IP

# Variables
SSH_PORT="2222"          # Port SSH personnalisé
SSH_USER="user"          # Utilisateur SSH sur la machine B
REPO_DIR="votre-repository"  # Répertoire à déployer

# Étape 1: Vérifier que la machine B est accessible
echo "Vérification de l'accès à la machine B ($MACHINE_B_IP)..."
ping -c 1 $MACHINE_B_IP > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "La machine B ($MACHINE_B_IP) n'est pas accessible. Vérifiez la connectivité réseau."
  exit 1
fi

# Étape 2: Installer Docker et Docker Compose sur la machine B
echo "Installation de Docker et Docker Compose sur la machine B..."
ssh $SSH_USER@$MACHINE_B_IP << 'EOF'
  sudo apt update
  sudo apt install -y docker.io docker-compose
  sudo usermod -aG docker $USER
EOF

# Étape 3: Copier le répertoire sur la machine B
echo "Copie du répertoire $REPO_DIR sur la machine B..."
scp -r ./$REPO_DIR $SSH_USER@$MACHINE_B_IP:/home/$SSH_USER/

# Étape 4: Démarrer les conteneurs Docker
echo "Démarrage des conteneurs Docker sur la machine B..."
ssh $SSH_USER@$MACHINE_B_IP << 'EOF'
  cd /home/$USER/$REPO_DIR
  docker-compose up -d
EOF

# Étape 5: Configurer SSH pour écouter sur un port spécifique et n'autoriser que les clés SSH
echo "Configuration de SSH sur la machine B..."
ssh $SSH_USER@$MACHINE_B_IP << 'EOF'
  sudo sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config
  sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
  sudo systemctl restart ssh
EOF

# Étape 6: Vérifier le déploiement
echo "Vérification du déploiement..."
ssh $SSH_USER@$MACHINE_B_IP "docker ps"

echo "Déploiement terminé avec succès !"
echo "Vous pouvez maintenant vous connecter à la machine B via SSH sur le port $SSH_PORT :"
echo "  ssh -p $SSH_PORT $SSH_USER@$MACHINE_B_IP"