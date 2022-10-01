#! /bin/bash

#Asignando el Color del texto
Rojo='\033[31m'

#Creando variables para los valores
Hr=$(date +%H) #Variable con la hora actual
Min=$(date +%M) #Variable con el minuto actual
Seg=$(date +%S) #Variable con el segundo actual
Fecha=$(date +%F)

#Muestra de la hora al Usuario
printf "$Rojo"
echo "La hora del sistema es: $Fecha $Hr:$Min:$Seg"
