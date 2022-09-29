 #!/bin/bash
'  
    _____
    |   \|
    |    |
         |
         |
         |
 ________|____
 
 
    _____
    |   \|
    |    |
    o    | Alerta 1.
         |
         |
 ________|____
 

    _____
    |   \|
    |    |
    o    |
   /     | Alerta 2.
         |
 ________|____

 
    _____
    |   \|
    |    |
    o    |
   /|    | Alerta 3.
         |
 ________|____
  

    _____
    |   \|
    |    |
    o    |
   /|\   | Alerta 4.
         | 
 ________|____
 
 
     _____
    |   \|
    |    |
    o    |
   /|\   | Alerta 5.
   /     | 
 ________|____


     _____
    |   \|
    |    |
    o    |
   /|\   | Alerta 6, ni modo bro, ya perdiste
   / \   | 
 ________|____

 '
clear
opc=0
salida=2
dibujo=3
while [ "$opc" != "$salida" ]
do
echo "Que quieres hacer? "
echo "1)Jugar"
echo "2)salir"
    read opc
    case $opc in
        1)
        clear
        echo -n "¿Ingresa la palabra que se va adivinar?: "
        read secreto                                 #Aquí se va a leer la palabra que nosotros intetaremos adivinar
        clear
        asterisco="*"
        
        letras=`echo $secreto | sed "s/[^${asterisco}]/*"/g` #Aqui se modifica toda la palabra que ingresamos con elcomando sed convirtiendola por *
        sust=$letras
      ##  while [ "$sust" -ne  -o "$stats" -eq 0 ]
        while [[ $sust != $secreto || $error -eq 6 ]]
	do
		echo
		echo "LAS LETRAS SON $sust"
		echo
		sed -n "$dibujo,$((dibujo+7))p" $0
		echo
		echo LETRAS INTRODUCIDAS HASTA AHORA: $a
		echo
         	echo -n "INTRODUCE UNA LETRA: "
		read asterisco
         	a=${a}$asterisco
         	palabra=${asterisco}$palabra    #CONCATENA LAS LETRAS QUE METEMOS CON LAS QUE HAY YA INTRODUCIDAS	
         	echo "$palabra"
		existe=`echo ${secreto} | grep ${asterisco}` #COMPARA, Y SI NO SON IGUALES, NO MUESTRA NADA
		if [ "$existe" = "" ]
		then
                	echo "Bro creo que la letra $asterisco no aparece en la palabra"
         		error=$((error + 1))
                        if [ $error = 6 ]
                        then
				dibujo=$(($dibujo+9))
                     		sed -n "$dibujo,$((dibujo+7))p" $0
                     		echo "Cometiste  $error errores, la palabra secreta era: $secreto"
                                echo
			        echo
			else
				echo "Oye has cometido $error error(es)"
                                dibujo=$(($dibujo+9))

			fi
		else
			sust=`echo $secreto | sed "s/[^${palabra}]/*"/g` #En esta parte si se acierta con la letra ingresada se sustituira en la palabra oculta
		fi
			if [ "${sust}" = "${secreto}" ] #SI SON IGUALES
			then
                        	clear
                                echo "ENHORABUENA. HAS DESCUBIERTO LA PALABRA SECRETA. LA MISMA ES: ${secreto}."
                        	echo
         			echo
			fi
	done
    esac
done

