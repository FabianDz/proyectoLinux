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
    o    |
         |
         |
 ________|____
 

    _____
    |   \|
    |    |
    o    |
   /     |
         |
 ________|____

 
    _____
    |   \|
    |    |
    o    |
   /|    |
         |
 ________|____
  

    _____
    |   \|
    |    |
    o    |
   /|\   |
         | 
 ________|____
 
 
     _____
    |   \|
    |    |
    o    |
   /|\   |
   /     | 
 ________|____


     _____
    |   \|
    |    |
    o    |
   /|\   |
   / \   | 
 ________|____

 '
clear
opc=0
salida=2
echo "----------------------AHORCADO----------------------"
while [ "$opc" != "$salida" ]
do
dibujo=3
error=0
unset sust #unset lo utilizo para borrar lo que almacena la variable cuando se repite el ciclo y no tener las mismas letras que en eljuego pasado
unset a
unset palabra
echo "Hola, bienvenido a nuestro juego, a continuacion ingresa la opcion que deseas hacer"
echo "1)Jugar"
echo "2)salir"
    read opc #Es para repetir el ciclo las veces que el usuario quiera
    case $opc in
    
        1)
        clear
        echo "NOTA: Recuerda que no son iguales las minusculas y las mayusculas"
        echo "¿Qué palabra quieres que adivinen?: "
        read secreto                                 #Aquí se va a leer la palabra que nosotros intetaremos adivinar
        clear
        sust="-"
        
        letras=`echo $secreto | sed "s/[^${sust}]/-"/g` #Aqui se modifica toda la palabra que ingresamos con elcomando sed convirtiendola por -
        aux=$letras
        while [ "$aux" != "$word" ] #Se utiliza este ciclo para que acabe cuando descubramos la palabra secreta o cuando fallemos las veces que se nos permita
	do
		echo "LAS LETRAS SON $aux" #Aquí aparce las palabra sustituida por '-' y tambien cuando acertamos las letras de la palabra
		sed -n "$dibujo,$((dibujo+7))p" $0 #sed se utiliza para tomar una parte del archivo dandole parametros y de cuanto en cuanto toma cada vez
		echo "Estas son las letras que ya has usado: $a" #Aquí apareceran las letras que ya hemos ingresado 

         	echo -n "Ingresa la letra: "
		read sust #En esta parte es donde leemos la letra que ingresa el usuario para adivinar la palabra
         	a=${a}$sust
         	palabra=${sust}$palabra    #Lo que hicimos aquí es concatenar las letras ingresadas	
		existe=`echo $secreto | grep $sust` #Hacemos la comparacion en donde si no es igual no aparece nada
		if [ "$existe" = "" ]
		then
                	echo "Bro creo que la letra $sust no aparece en la palabra" #La frase aparece cuando la letra que ingresamos no esta en la palabra secreta 
         		error=$((error + 1)) 
                        if [ $error = 6 ] #En esta condicion la utilizamos para cuando llega al limite de errores que tiene, que en este caso es 6
                        then
				dibujo=$(($dibujo+9)) 
   	                        clear
                     		sed -n "$dibujo,$((dibujo+7))p" $0 #Esta parte se usa para tomar la parte del codigo dando valores de que a que parrafo y cuantos vamos a tomar
                     		echo "Kmara mi tibio cometiste $error errores, la palabra secreta era: $secreto" #El mensaje se muestra cuando llegaste almaximo de errores, mostrandote la palabra secreta que debias de adivinar
                         break
       			 else
   				echo "Oye has cometido $error error(es)" #En esta frase se muestra el número de errores que has cometido
                                dibujo=$(($dibujo+9))

			 fi
		else
			aux=`echo $secreto | sed "s/[^${palabra}]/-"/g` #En esta parte si se acierta con la letra ingresada se sustituira en la palabra oculta
		fi
			if [ "$aux" = "$secreto" ] #Aquí es cuando entra al momento de que le atinen a la palabra
			then
                        	clear
                                echo "Le atinaste mi tibio, la palabra era: ${secreto}." #El texto aparece cuando le atinas a la palabra, dandote la palabra secreta
                            break
         			echo
			fi
	done
    esac
echo "Adios, espero que vuelvas pronto  :(:"
done
