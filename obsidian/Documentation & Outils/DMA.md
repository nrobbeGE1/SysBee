Le DMA transfère les octets de la trame dans la mémoire pour que le µC puisse s'occuper d'autres opérations en parallèle.
La fin de la Rx d'une trame XBee peut être détectée par le DMA (il envoie une notif au µC quand le bus UART est libre).

__HAL_DMA_GET_COUNTER




**Code fonctionnel pour recevoir une trame avec ReceiveToIdle :**
[[main.c Rx DMA avec ReceiveToIdle_DMA (à nettoyer)]]