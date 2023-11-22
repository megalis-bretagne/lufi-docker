#!/bin/bash


# Vérification du nombre d'arguments
if [ "$#" -eq 0 ]; then
    command="start"
else
    command=$1
fi


# Condition pour exécuter différentes commandes en fonction du paramètre
if [ "$command" = "start" ]; then
    echo "Exécution de la commande 1"
    carton exec hypnotoad /lufi/script/lufi
elif [ "$command" = "cron" ]; then
    echo "Exécution des cron"
    cron -f
    # Ajoutez ici la commande que vous souhaitez exécuter pour "commande2"
else
    echo "Commande non reconnue: $command"
    exit 1
fi

# print logs
tail -f /lufi/log/production.log