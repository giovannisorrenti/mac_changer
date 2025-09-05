#!/bin/bash

# Controlla se lo script è eseguito come root
if [ "$EUID" -ne 0 ]; then
    echo "Questo script deve essere eseguito come root"
    exit 1
fi

# Controlla se macchanger è installato
if ! command -v macchanger &> /dev/null; then
    echo "macchanger non è installato. Installalo con: sudo apt-get install macchanger"
    exit 1
fi

# Specifica l'interfaccia di rete (modifica con la tua interfaccia, es. wlan0, eth0)
INTERFACE="wlan0"

# Controlla se l'interfaccia esiste
if ! ip link show "$INTERFACE" &> /dev/null; then
    echo "L'interfaccia $INTERFACE non esiste. Specifica una valida interfaccia di rete."
    exit 1
fi

echo "Cambio dell'indirizzo MAC per $INTERFACE ogni 5 secondi..."

while true; do
    # Porta giù l'interfaccia
    ip link set "$INTERFACE" down
    # Cambia l'indirizzo MAC
    macchanger -r "$INTERFACE"
    # Porta su l'interfaccia
    ip link set "$INTERFACE" up
    # Aspetta 5 secondi
    sleep 5
done