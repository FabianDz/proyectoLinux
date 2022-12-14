#!/bin/bash
# trap para evitar que salga del script con control +z o +c
trap '' SIGTSTP SIGINT SIGTERM
#Inicio de sesion
echo -n "Ingrese su usuario pa: "
read c_usuario #Leemos usuario

cu=$(grep "$c_usuario" /etc/passwd) # Buscamos si existe

if [[ $? -eq 0 ]] ; then # Si no dio error
	echo -n "Ahora deme su contraseña compadre: "
	read -s contra # Leemos contraseña en secreto
	echo "$contra" | su - "$c_usuario" 2> /dev/null #le pasamos la contra al su y si falla, mandamos el error a dev/null
	if [[ $? -eq 0 ]] ; then # Si si es la contraseña
		clear # Limpiamos pantalla
	else # Si no es la contraseña
		echo ""
		echo "Contraseña incorrecta, llamame cuando la recuerdes"
		exit # Salimos
	fi

else # Si no existe el usuario
	echo "No existes, primero existe y despues hablamos"
	exit $? # Salimos
fi

# Guardamos la direccion absoluta original en una variable
diror=$(pwd)

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
			#Usamos diror para ejecutar sin importar donde estemos
			. "$diror/"ayuda.sh
			;;
		"infosis") #Muestra informacion del sistema
			#Usamos diror para ejecutar sin importar donde estemos
			. "$diror/"infosis.sh
			;;
		"fecha") #Nos da la fecha y hora
			#Usamos diror para ejecutar sin importar donde estemos
			. "$diror/"Hora.sh
			;;
		"search") #Busca un archivo en un directorio
			#Usamos diror para ejecutar sin importar donde estemos
			. "$diror/"search.sh
			;;
		"creditos") #Muestra los creditos de los programadores
			#Usamos diror para ejecutar sin importar donde estemos
			. "$diror/"creditos.sh
			;;
		"juego") #Despliega un juego
			#Usamos diror para ejecutar sin importar donde estemos
			. "$diror/"ahorcado.sh
			;;
		"musica") #Reproductor mp3
			#Usamos diror para ejecutar sin importar donde estemos
			. "$diror/"reproductor.sh
			;;
		*) #Cualquier otra cosa o comando de Linux
			$opc
			;;
	esac
done

#Nos despedimos antes de salir del programa
echo "Usted ha salido de la mejor terminal del planeta, nos vemos Bob Esponja"

#Cerramos el trap

trap '' SIGTSTP SIGINT SIGTERM
