Objectif: se donner toutes les ressources pour (bien) faire le PCB en one-shot

-DMA:
		-Liaison DMA µC -> PC  ✔️
		-Liaison DMA PC -> µC ✔️
		-Commandes AT µC -> Xbee
		-Liaison DMA µC -> µC via Xbee

-Etude PCB:
		-Placement Xbee
		-Ajout nouveau connecteur LoRa : solution mini connect (connecteur rouge)
		7 pins : 
			- +3,3V, GND, 
			- SPI MISO, MOSI, SS, SCLK, 
			- Reset, DI0 
		-Déplacement trous de fixation (à éloigner des pistes)
		-Ajout d'autres capteurs?
		-Switch booloader -> programmer le µC par liaison USB