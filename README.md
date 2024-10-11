# Projet outil
# L'objectif du projet
L'objectif de ce projet est de créer un script Shell qui extrait périodiquement la température actuelle d'une ville 
donnée ainsi que les prévisions météorologiques pour le lendemain en utilisant le service wttr.in le script enregistre-
ra les informations extraites dans un fichier texte , chaque enregistrement devant apparaitre sur une seule ligne .
# Comment exécuter le script 
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
 
