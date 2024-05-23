#!/bin/bash


if [ "$#" -eq 0 ]; then
    command="start"
else
    command=$1
fi

if [ "$command" = "start" ]; then
    echo "Starting Lufi ..." >> /home/nonroot/lufi/log/production.log
    carton exec hypnotoad /home/nonroot/lufi/script/lufi
elif [ "$command" = "cron" ]; then
    echo "Executing cron" >> /home/nonroot/lufi/log/production.log
    crontab /etc/cron.d/lufi-cron
    cron -f &
else
    echo "Unrecognized command: $command"
    exit 1
fi

# print logs
tail -f /home/nonroot/lufi/log/production.log