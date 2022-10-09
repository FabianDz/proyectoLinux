#! /bin/bash

#Asignando el Color del texto
Rojo='\033[31m'



#Sincronizando el reloj RTC con el reloj local
timedatectl set-local-rtc 1

#Muestra la  fecha y hora actuales
printf "$Rojo"
printf "La hora del sistema es: "
cat /proc/driver/rtc | grep 'rtc_time' | grep "[0-9]*:[0-9]*:[0-9]*" -o
printf "La fecha del sistema es: "
cat /proc/driver/rtc | grep 'rtc_date' | grep "[0-9]*-[0-9]*-[0-9]*" -o

#/proc/driver/rtc es el archivo que mantiene el tiempo del sistema aun si esta apagado '
#Las lineas 'rtc_date' y 'rtc_time' nos dan la fecha y hora del sistema
#El segundo grep le indicamos el formato en el que estan los datos
#El formato de la fecha es: AAAA-MM-DD
#El formato de la hora es: HH:MM:SS
