Ecco un esempio di **README.md** per documentare lo script che hai scritto:

---

# MAC Address Rotator

Questo script Bash cambia periodicamente l’indirizzo **MAC** di una specifica interfaccia di rete Linux utilizzando [macchanger](https://linux.die.net/man/1/macchanger).
Può essere utile per motivi di **privacy** e **anonimato** durante la navigazione.

## ⚠️ Attenzione

* Deve essere eseguito come **root**.
* L’uso improprio potrebbe causare **perdita di connessione** o conflitti di rete.
* Cambiare frequentemente MAC può essere rilevato da sistemi di sicurezza (IDS/IPS, firewall).
* Si consiglia l'uso di una VPN per una sicurezza maggiore

---

## 📋 Requisiti

* Linux con `bash`
* [macchanger](https://linux.die.net/man/1/macchanger) installato
* Permessi di **root**

### Installazione di macchanger (Debian/Ubuntu):

```bash
sudo apt-get update
sudo apt-get install macchanger
```

---

## 🚀 Utilizzo

1. Clona o scarica lo script
2. Rendi eseguibile il file:

   ```bash
   chmod +x mac_rotator.sh
   ```
3. Esegui lo script come root:

   ```bash
   sudo ./mac_rotator.sh
   ```

---

## 🔧 Configurazione

All’interno dello script modifica la variabile:

```bash
INTERFACE="wlan0"
```

con il nome della tua interfaccia di rete (es. `eth0`, `wlan0`, `enp3s0`).

Per verificare le interfacce disponibili:

```bash
ip link show
```

---

## ⚙️ Funzionamento

* Porta giù l’interfaccia (`ip link set INTERFACE down`)
* Genera un MAC casuale con `macchanger -r`
* Riporta su l’interfaccia (`ip link set INTERFACE up`)
* Ripete ogni 5 secondi

Puoi modificare l’intervallo cambiando il valore in:

```bash
sleep 5
```

---

## 🛑 Interrompere lo script

Premi `CTRL + C` per terminare l’esecuzione.
Per ripristinare il MAC originale:

```bash
sudo macchanger -p wlan0
```

---

