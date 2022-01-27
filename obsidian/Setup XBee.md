Configurer les cartes pour qu'elles aient le même PANID (ID) et même valeur de Scan Channels (SC)
JV = 1
SM = 0 pour un Router/Coordinator
SM = 4 pour un End Device

Pour l'échantillonnage logique d'un pin:
	2 modes:
			IR (Sampling Rate) et IC (Change Detection)
			IR: On lit périodiquement l'état d'un pin
			IC: On lit la valeur du pin à chaque changement d'état
			Il faut configurer le masque de lecture pour cibler le/les bon.s pin.s

Erreur "error discovering neighbors of <MAC>" -> factory reset de la carte... (retour à un profil stable insuffisant)