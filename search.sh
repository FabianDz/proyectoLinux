#!/bin/bash

echo ""
# Pedimos, y leemos, la carpeta a buscar
echo -ne "\e[1;37mSeñale la carpeta a buscar, buen hombre: \e[0m"
read car

# Buscamos con grep una coincidencia exacta para saber si existe
# mandamos a /dev/null la respusta o el posible error si no
ls -l | grep -w $car >/dev/null 2>/dev/null

# Si el comando no fue exitoso
if [[ $? -ne 0 ]]
then
	echo ""
	echo -e "\e[1;31mNo hay coincidencias padrino, sorry\e[0m"
	echo ""
	exit
else
	# Si es exitoso, colocamos la primera letra d o -
	# dentro de buscar
	buscar=$(ls -l | grep -w $car | cut -c 1)
fi
# Comparamos si es directorio (d) o si no es (-)
# tambien si existe un error, lo mandamos a /dev/null
if [[ $buscar -eq "d" ]] 2>/dev/null
then
	# Si se encontro el directorio
	# Solicitamos el nombre de archivo
        echo -ne "\e[1;37mAhora digite el archivo a buscar caballero: \e[0m"
	read arch

	# Repetimos el proceso del directorio
	ls -l "$car/" | grep -w $arch >/dev/null 2>/dev/null
	# Si el comando no fue exitoso

	if [[ $? -ne 0 ]] # Si es diferente a 0, es un error
	then
        	echo ""
		echo -e "\e[1;31mNo hay coincidencias padrinazo, meper?\e[0m"
        	echo ""
		exit
	else
        	# Si es exitoso, colocamos la primera letra d o -
        	# dentro de busarc
        	busarc=$(ls "$car" -l | grep -w $arch | cut -c 1)
	fi
	# Comparamos si es directorio (d) o si no es (-)
	# tambien si existe un error, lo mandamos a /dev/null
	if [[ $busarc -eq "d" ]] 2>/dev/null
	then
		# Si es un directorio
		echo ""
		echo -e "\e[1;31mNo pues, como te digo que es otra carpeta?\e[0m"
		echo ""
	else
		# Si se encuentra el archivo
		echo ""
		# Guardamos el nombre completo del archivo (con extension)
		nomarch=$(ls -l "$car" | grep -w ola | cut -d ' ' -f1-12 --complement)
		echo -ne "\e[1;37mSi existe el archivo:\e[0m"
		echo -e "\e[1;34m $car/$nomarch\e[1;34m"
		echo ""
	fi
else
	# Si no se encontro el directorio, avisamos y salimos
	echo ""
        echo -e "\e[1;31mNo es un directorio pa, checa tus fuentes\e[0m"
	echo ""
	exit
fi
