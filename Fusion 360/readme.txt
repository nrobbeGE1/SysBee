Le document boitier_sysbee_CAD est celui sur lequel tout le design du boîtier (sketches, contraintes, assemblage, etc) est créé et peut être modifié.

Le document boitier_sysbee_decoupe est le même sauf que tous les traits de construction ont été supprimés pour permettre la découpe laser.
Les contraintes sont donc cassées et il ne doit pas être utilisé pour modifier le boîtier. 
A noter qu'il a été créé pour "epaisseur" = 3 mm, et qu'il devra être généré de nouveau pour toute autre valeur d'"epaisseur", sauf si une nouvelle solution pour ne pas être embêté par les traits de construction est trouvée (ce qui serait quand même vachement beaucoup mieux).

boitier_sysbee_CAD dispose d'une cote paramétrique permettant d'adapter le schéma à l'épaisseur du matériau utilisé pour la découpe. On peut modifier la valeur de "epaisseur" dans Modify -> Change Parameters.

Les derniers fichiers générés pour la découpe laser sont rangés dans le dossier DXF, un fichier texte ou les noms de fichiers indiquent l'épaisseur choisie.

N.R