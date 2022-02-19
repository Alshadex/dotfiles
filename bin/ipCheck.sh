#!/bin/bash


newIP=$(curl ifconfig.co)
oldIP=$(head -n 1 /home/pi/bin/currentIP)
echo $newIP
echo $oldIP
if [[ $oldIP != $newIP ]]
then
	echo "IP Address Changed. Notifying..."
	echo "Writing new IP address to file"
	echo $newIP > /home/pi/bin/currentIP
	echo "Copying new IP to dh2026pc01.utm.utoronto.ca"
	scp /home/pi/bin/currentIP linalex7@dh2026pc01.utm.utoronto.ca:/student/linalex7/bin/
fi
