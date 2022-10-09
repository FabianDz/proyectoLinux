#! /bin/bash

# Asignando los colores de los textos que apareceran en el terminal
namarillo="\e[1;33m"
original="\e[0m"
nturquesa="\e[36m"
rojo="\e[31m"
nblanco="\e[1;37m"

#Asignando colores de fondo
bazul="\e[1;44m"
brojo="\e[4;41m"
bnegro="\e[1;40m"

#Verificamos que el paquete mpg123 este instalado
#en caso de que no, le damos la opcion al usuario de instalarlo

paquete=$(dpkg -l | grep mpg123 | grep mpg123 -o)
if [ -z "$paquete" ]
then  
    echo -e "${namarillo} No tienes instalado el paquete mpg123, es necesario para este comando, lo quieres instalar? s/n: ${namarillo}"
    read op
    if [ "$op" = "s" ]
    then
        sudo apt install mpg123
    else
        echo -e "${namarillo}Sorry mi pana pero no puedes continuar :(${namarillo}"
        exit
    fi
fi

#Codigo del reproductor
printf "${nblanco}"
echo -e "${bnegro}------------------------------------------------${bnegro}
${bnegro}|                                              |${bnegro}
${bnegro}|    Bienvenido al Reproductor de Musica       |${bnegro}
${bnegro}|                                              |${bnegro}
${bnegro}------------------------------------------------${bnegro}"
printf "${original}"


#variable donde estara el directorio con los archivos mpg
echo -e "${namarillo}Los archivos mp3 deben estar alojados en 
la carpeta Música del usuario${namarillo}"
cd ~/Música

while [ "$op" != "0" ]
do
    printf "${namarillo}"

    echo -e "${bnegro}-------------------------------------------${bnegro}
${bnegro}|      ${nblanco}¿Que comando ocupas?${namarillo}               |${bnegro}
${bnegro}-------------------------------------------${bnegro}
${bnegro}|      1) Reproducir todas las canciones  |${bnegro}
${bnegro}|      2) Reproducir una cancion          |${bnegro}
${bnegro}|      0) Salir                           |${bnegro}
${bnegro}-------------------------------------------${bnegro}"
    printf "${nblanco}"

    read op

    case $op in
        0) 
            echo ""
            echo -e "Nos vemos mi perro xD"
            printf "${original}"
            sleep 3
            clear
            exit
            ;;
        1)  
            printf "${namarillo}"
            echo -e "${bnegro}---------------------${bnegro}"
            echo -e "${bnegro}|  ${nblanco}¿En que modo?${namarillo}    |${bnegro}"
            echo -e "${bnegro}---------------------${bnegro}"
            echo -e "${bnegro}|  1) Lineal        |${bnegro}"
            echo -e "${bnegro}|  2) Aleatoria     |${bnegro}"
            echo -e "${bnegro}---------------------${bnegro}"
            printf "${nblanco}"
            read op2
            case $op2 in

                1)
                    clear
                    printf "${namarillo}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    echo -e "${bnegro}|         ${nblanco}COMANDOS DISPONIBLES${namarillo}                    |${bnegro}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    echo -e "${bnegro}|       S) Pausar/Reanudar cancion                |${bnegro}"
                    echo -e "${bnegro}|       F) Siguiente cancion                      |${bnegro}"
                    echo -e "${bnegro}|       D) Cancion anterior                       |${bnegro}"
                    echo -e "${bnegro}|       B) Empezar de nuevo la cancion            |${bnegro}"
                    echo -e "${bnegro}|       +) Subir volumen                          |${bnegro}"
                    echo -e "${bnegro}|       -) Bajar volumen                          |${bnegro}"
                    echo -e "${bnegro}|       U) Silenciar                              |${bnegro}"
                    echo -e "${bnegro}|       L) Mostrar las canciones disponibles      |${bnegro}" 
                    echo -e "${bnegro}|       Q) Parar el reproductor                   |${bnegro}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    mpg123 -C --title -q *.mp3
                    clear
                    ;;
                2)
                    clear
                    printf "${namarillo}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    echo -e "${bnegro}|         ${nblanco}COMANDOS DISPONIBLES${namarillo}                    |${bnegro}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    echo -e "${bnegro}|       S) Pausar/Reanudar cancion                |${bnegro}"
                    echo -e "${bnegro}|       F) Siguiente cancion                      |${bnegro}"
                    echo -e "${bnegro}|       D) Cancion anterior                       |${bnegro}"
                    echo -e "${bnegro}|       B) Empezar de nuevo la cancion            |${bnegro}"
                    echo -e "${bnegro}|       +) Subir volumen                          |${bnegro}"
                    echo -e "${bnegro}|       -) Bajar volumen                          |${bnegro}"
                    echo -e "${bnegro}|       U) Silenciar                              |${bnegro}"
                    echo -e "${bnegro}|       L) Mostrar las canciones disponibles      |${bnegro}" 
                    echo -e "${bnegro}|       Q) Parar el reproductor                   |${bnegro}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    mpg123 -C --title -q -z *.mp3
                    clear
                    ;;
                *)
                    clear
                    echo -e "Ese modo no me lo se bro"
                    ;;
                esac
            ;;
        2)  
            printf "${namarillo}"
            echo -e "${bnegro}---------------------------------------------------${bnegro}"
            echo -e "${bnegro}|         ${nblanco}CANCIONES DISPONIBLES${namarillo}                   |${bnegro}"
            echo -e "${bnegro}---------------------------------------------------${bnegro}"
            echo "$(ls -1)"
            echo -e "${bnegro}---------------------------------------------------${bnegro}"
            echo "Indica el nombre y formato del archivo de musica (EJEMPLO: Brother.mp3):"
            read cancion
            (printf "${namarillo}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    echo -e "${bnegro}|         ${nblanco}COMANDOS DISPONIBLES${namarillo}                    |${bnegro}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    echo -e "${bnegro}|       S) Pausar/Reanudar cancion                |${bnegro}"
                    echo -e "${bnegro}|       B) Empezar de nuevo la cancion            |${bnegro}"
                    echo -e "${bnegro}|       +) Subir volumen                          |${bnegro}"
                    echo -e "${bnegro}|       -) Bajar volumen                          |${bnegro}"
                    echo -e "${bnegro}|       U) Silenciar                              |${bnegro}" 
                    echo -e "${bnegro}|       Q) Parar el reproductor                   |${bnegro}"
                    echo -e "${bnegro}---------------------------------------------------${bnegro}"
                    mpg123 -C --title -q $cancion && clear) || (clear && echo -e "Esa cancion no la topo :(")
            ;;
        *)  
            clear
            echo -e "Ponme una opcion valida mijo xD"
            ;;
    esac
done
