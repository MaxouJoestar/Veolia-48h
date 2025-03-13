#!/bin/bash
echo "Proxy Management Interface"

# Add a new relay (example)
add_relay() {
  echo "Adding new relay..."
}

# Visualisation des relais configurés
list_relays() {
  cat /etc/squid/squid.conf
}

# Exécution
if [[ $1 == "add" ]]; then
  add_relay
elif [[ $1 == "list" ]]; then
  list_relays
else
  echo "Invalid option"
fi