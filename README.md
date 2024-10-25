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
crontab -e 

### Versions 2
- Ajouter une ligne pour exécuter le script toutes les heures :
- Definir une ville par defaut. J'ai mis la ville de Toulouse comme ville par défaut.
- Recuperer les donnees meteo actuelles : J'ai utilise curl pour obtenir la condition meteo et a la temperature de la ville et stocke ces donnees dans une variable data.
- Extraire et verifier les informations : j'ai utilise awk pour isoler la temperature actuelle et la condition météo
- J'ai enregistrer les informations
