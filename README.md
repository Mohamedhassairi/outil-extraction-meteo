# Projet outil
# L'objectif du projet
L'objectif de ce projet est de créer un script Shell qui extrait périodiquement la température actuelle d'une ville 
donnée ainsi que les prévisions météorologiques pour le lendemain en utilisant le service wttr.in le script enregistre-
ra les informations extraites dans un fichier texte , chaque enregistrement devant apparaitre sur une seule ligne .
# Comment exécuter le script

## Historiques des modifications pour v1 
### Version 1.0 
- Création du script de base 'Extracteur_Météo.sh' .
- Récupération des données météo avec 'curl' .
- Extraction et formatage des données .
- En fin , enregistrement des données dans 'meteo.txt' .
### Version 1.1 
- Ajout de la gestion des erreurs pour la récupération des données .
- Amélioration du format d'affichage des informations dans 'meteo.txt' .



 
- pour récuperer la météo d'une ville spécifique :
```bash
./Extracteur_Météo.sh [ville]
```

par exemple :
```bash
./Extracteur_Météo.sh Toulouse 

# Comment configurer cron
- Ouvrir le crontab avec la commande :
```bash
crontab -e 
```
- Ajouter une ligne pour exécuter le script toutes les heures :
```bash
0**** /chemin/vers/mon/script/Extracteur_Météo.sh
 
