Objectif: se donner toutes les ressources pour (bien) faire le PCB en one-shot

-DMA:
		-Liaison DMA µC -> PC  ✔️
		-Liaison DMA PC -> µC ✔️
		-Commandes AT µC -> Xbee
		-Liaison DMA µC -> µC via Xbee

-Etude PCB:
		-Placement Xbee ✔️
		-Ajout nouveau connecteur LoRa : micromatch ✔️
			8 pins : 
				- +3,3V, GND, 
				- SPI MISO, MOSI, SS, SCLK, 
				- Reset, DI0
		-Déplacement trous de fixation (à éloigner des pistes) ✔️
		-Ajout d'autres capteurs (connecteurs bus OneWire) ✔️
		-Switch booloader -> à remplacer par header 2 pin (+ cavalier) ✔️
		-Bouton reset -> à remplacer par header 2 pin (+ cavalier) ✔️
		-Choix coordinateur -> header (+ cavalier) (choix de pin à faire)