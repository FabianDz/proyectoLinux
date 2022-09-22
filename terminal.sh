#!/bin/bash

#Bucle infinito para que no salga hasta que se teclee salir
while true
do
#Prompt que se actualiza cada que se pone un nuevo comando
prompt="\e[0;36m\e[0;1;36m["$USER"]\e[0;36m\e[0;38;5;164m:-\e[0;38;5;128m "$(date +"%T")" \e[0;38;5;126m-:\e[0;91m\e[0;91m["$HOSTNAME"]\e[0;91m\e[0;38;5;96m\e[0;38;5;96m("$PWD")\e[0;38;5;96m\n\e[0;38;5;227m\e[0;5;38;5;227m >\e[0m"
opc=()
	#Imprime el prompt
	echo -ne $prompt
	#Lee la opcion
	read opc
	#Switch para determinar si es comando propio o nativo
	case $opc in
		"salir") #Caso salir rompe el bucle y sale
			break 
			;;
		"ayuda") #Muestra los comandos propios y su descrp
			echo "ayuda"
			;;
		"infosis") #Muestra informacion del sistema
			echo "infosis"
			;;
		"fecha") #Nos da la fecha y hora
			echo "fecha y hora"
			;;
		"buscar") #Busca un archivo en un directorio
			echo "buscar"
			;;
		"creditos") #Muestra los creditos de los programadores
			echo "creditos"
			;;
		"juego") #Despliega un juego
			echo "jueguito"
			;;
		"musica") #Reproductor mp3
			echo "musica"
			;;
		*) #Cualquier otra cosa o comando de Linux
			$opc
			;;
	esac
done

#Nos despedimos antes de salir del programa
echo "Usted ha salido de la mejor terminal del planeta, nos vemos Bob Esponja"
