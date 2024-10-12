#!/bin/bash

# Vérifier si un argument de ville est passé 
if [ -z "$1" ]; then
    echo "Veuillez fournir une ville en argument ."
    exit 1
fi

ville=$1

# Etape 1: Utiliser curl pour récupérer les données méteo
# Récupération des données brutes  depuis wttr.in

data=$(curl -s "wttr.in/$ville?format=%C+%t") # %C pour météo et %t pour température


# Vérifier si la récupération a reussi
if [ $? -ne 0 ]; then
    echo "Erreur lors de la récupération des données météo."
    exit 1
fi

# Vérifier si les données récupérées contiennent une erreur  
if [[ "$data" == *"404"* ]] || [[ "$data" == *"not found"* ]] || [[ -z "$data" ]]; then
    echo "Erreur : Impossible de récupérer les données météo pour '$ville'. Ville introuvable."
    exit 1
fi
# Etape 2 : Extraire la température actuelle
temperature_actuelle=$(echo "$data" |  awk '{print $2}')
condition=$(echo "$data" | awk '{print $1}')

# Etape 3 : Formater les informations 
# Pour obtenir la provision , nous ferons une autre requete
prevision=$(curl -s "wttr.in/$ville?format=%t")

# Vérifier si la prévision est vide 
if [[ -z "$prevision" ]]; then
    echo "Erreur : Impossible de récupérer la prévision météo pour '$ville'."
    exit 1
fi


# Etape 4 : Enregistrer  les informations dans le fichier meteo.txt
echo "$(date '+%Y-%m-%d- %H:%M') - $ville : $temperature_actuelle - $prevision" >> meteo.txt

# Affichage d'un message de confirmation 
echo "Données météo enregistrées dans meteo.txt. allez-y dans le fichier pour les voir ."

