Automate général du système de comptage et d'alerte
Modules XBee
1. configuration des modules xbee (XCTU) -> Dans l'automate de config, noms d'états peu clairs + envoi seulement partiel des commandes de configuration
2. envoi/réception de trame (API)

DMA
émission et réception sous DMA

Développement du firmware


timers : f = 2.097 MHz

f(update_trafic()) = (2,097.10^6)/65535.320 = 0,099 Hz
f(update_led()) = (2,097.10^6)/65535.15 = 2,133 Hz
f(scan_sensors()) = (2,097.10^6)/8192.3 = 85 Hz