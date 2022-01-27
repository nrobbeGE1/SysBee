Automate général du système de comptage et d'alerte
Modules XBee
1. configuration des modules xbee (XCTU) -> Dans l'automate de config, noms d'états peu clairs + envoi seulement partiel des commandes de configuration
2. envoi/réception de trame (API)

DMA
émission et réception sous DMA

Développement du firmware

Pour générer le workspace VSCode: 
- Créer un projet sur le site mbed (Online IDE) 
- Importer la library 'mbed' et 'rtos' (+ toute autre library nécessaire) depuis le wizard (clic droit sur le projet -> Import Library -> Import Wizard) 
- Exporter le projet (clic droit sur le projet -> Export Program -> Choisir la bonne carte en "Export Target" et "VSCode-GCC-ARM" dans "Export Toolchain" -> Export)
- Ouvrir le workspace dans VSCode