#!/bin/bash

# Vérifier si un argument de ville est passé , sinon utiliser Toulouse comme ville par défault
CITY=${1:-"Toulouse"}


#Récupérer les données météo brutes 
METEO_DATA=$(curl -s "wttr.in/$CITY?format=3) || {
    echo "$(date '+%Y-%m-%d %H:%M') - Erreur de connexion à wttr.in" >> meteo_error.log
    exit 1
}

# Extraire la température actuelle et les prévisions 
TEMP=$(echo "$METEO_DATA" | awk '{print $2}') # Température actuelle
FORECAST=$(curl -s "wttr.in/$CITY?format=%f" # Prévisions pour le lendemain

# Vérifier si la récupération de la prévision a échoué
if [ -z "$FORECAST" ]; then
    echo "$(date '+%Y-%m-%d %H:%M') - Erreur de récupération de la prévision " >> meteo_error.log
    exit 1
fi

# Obtenir la date et l'heure actuelles 
CURRENT_DATE=$(date '+%Y-%m-%d')
CURRENT_TIME=$(date '+%H:%M')

# Enregistrer les informations dans un fichier meteo.txt
echo "$CURRENT_DATE - $CURRENT_TIME - $CITY : $TEMP - $FORECAST" >> meteo.txt
