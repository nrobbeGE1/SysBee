Le document boitier_sysbee_CAD est celui sur lequel tout le design du boîtier (sketches, contraintes, assemblage, etc) est créé et peut être modifié.

boitier_sysbee_CAD dispose d'une cote paramétrique permettant d'adapter le schéma à l'épaisseur du matériau utilisé pour la découpe. On peut modifier la valeur de "epaisseur" dans Modify -> Change Parameters. De plus, une autre constante "epaisseur_planche_fixation" a été introduite, elle est à définir en fonction de l'épaisseur voulue pour la planche de fixation de la carte, qui peut être plus fine pour faciliter la lecture des capteurs.

Le document boitier_sysbee_decoupe est celui, sans traits de construction et avec arrondis qui sert à générer les fichiers DXF pour la découpe laser.
Les contraintes sont donc cassées et il ne doit pas être utilisé pour modifier le boîtier. 
A noter qu'il a été créé pour "epaisseur" = 5 mm, et "epaisseur_planche_fixation" = 3 mm, et qu'il devra être généré de nouveau pour toutes autres valeurs, sauf si une nouvelle solution pour ne pas être embêté par les traits de construction est trouvée (ce qui serait quand même vachement beaucoup mieux).

Les derniers fichiers générés pour la découpe laser sont rangés dans le dossier DXF, un fichier texte ou les noms de fichiers indiquent l'épaisseur paramétrée.

N.R