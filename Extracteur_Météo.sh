#!/bin/bash

# Définir une ville par défaut si aucun argument n'est fourni
ville=${1:-Paris}

# Etape 1: Utiliser curl pour récupérer les données météo
data=$(curl -s "wttr.in/$ville?format=%C+%t") # %C pour météo et %t pour température
echo "Données brutes : $data"

# Vérifier si la récupération a réussi
if [ $? -ne 0 ] || [ -z "$data" ]; then
    echo "Erreur lors de la récupération des données météo."
    exit 1
fi

# Etape 2 : Extraire la température actuelle et la condition
temperature_actuelle=$(echo "$data" | awk '{print $2}')
condition=$(echo "$data" | awk '{print $1}')

# Etape 3 : Récupérer la prévision pour demain
prevision=$(curl -s "wttr.in/$ville?format=%t")

# Etape 4 : Enregistrer les informations dans le fichier meteo.txt
echo "$(date '+%Y-%m-%d %H:%M') - $ville : $temperature_actuelle - $prevision" >> meteo.txt

# Affichage d'un message de confirmation
echo "Données météo enregistrées dans meteo.txt :"