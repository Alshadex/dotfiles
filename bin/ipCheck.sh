#!/bin/bash

webhookUrl="https://discord.com/api/webhooks/1202994608293023786/RpyS-ctKJlHM2rnAuUlcGe1eYSG67zRih1tPzD0nh9Rp4w3h2XeFRz7WvUAC1oP6sdL1"
currentIPFile="/root/currentIP"

newIP=$(curl -s4 icanhazip.com)

if [ -z $newIP ]; then
    exit 1
fi

if [ ! -e $currentIPFile ]; then
    touch $currentIPFile
    echo $newIP > $currentIPFile
fi

oldIP=$(head -n 1 $currentIPFile)

if [[ $oldIP != $newIP ]];
then
        content="Athena Public Ipv4 updated to ${newIP} from ${oldIP}"
        curl -X POST -H 'Content-type: application/json' -d "{\"content\": \"$content\"}" ${webhookUrl}
        echo $newIP > $currentIPFile
fi
