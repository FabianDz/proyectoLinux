#! /bin/bash

Violeta='\e[1;35m'

printf "$Violeta"
printf "La memoria total de la ram del sistema es: "
cat /proc/meminfo | grep 'MemTotal' | cut -c 18-30
printf "La memoria libre de la ram del sistema es: "
cat /proc/meminfo | grep 'MemFree' | cut -c 18-30
printf "La memoria total de la ram del sistema es: "
cat /proc/meminfo | grep 'MemAvailable' | cut -c 18-30
printf "La arquitectura del sistema es: "
cat /etc/apt/sources.list | grep "Linux" | cut -d ' ' -f8
printf "La versión del SO es: "
cat /etc/os-release | grep 'PRETTY_NAME' | cut -c 13-30
