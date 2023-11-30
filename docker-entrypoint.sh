#!/bin/bash


if [ "$#" -eq 0 ]; then
    command="start"
else
    command=$1
fi

if [ "$command" = "start" ]; then
    carton exec hypnotoad /lufi/script/lufi
elif [ "$command" = "cron" ]; then
    echo "Executing cron"
    cron -f
else
    echo "Unrecognized command: $command"
    exit 1
fi

# print logs
tail -f /lufi/log/production.log