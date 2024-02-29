listar(){
	echo "* * * L I S T A R   C O N T E N I D O * * *"
	read -p "Ingrese la ruta absoluta al fichero o carpeta: " ruta 
	ls -l "$ruta"
	return_menu
	}
	
crearArchivo(){
	echo "* * * A R C H I V O   D E  T E X T O * * *"
	read -p "Ingrese texto: " texto
	echo "$texto" > archivo.txt
	echo "Archivo creado de forma exitosa :)"
	return_menu
	}
	
compararArchivos(){
	echo "* * * C O M P A R A R   A R C H I V O S * * *"
	read -p "Ingrese nombre del primer archivo: " archivo
	read -p "Ingrese nombre del segundo archivo: " archivo2
	diff "$archivo" "$archivo2"
	return_menu
	}
	
funcion_awk(){
	echo "* * * CANTIDAD DE LINEAS DEL ARCHIVO * * *"
	read -p "Ingrese nombre del archivo:" archivo
	awk 'END {print NR "Total de lineas:"}' "$archivo"
	return_menu
	}
	
funcion_grep(){
	echo "* * * BUSCAR PALABRA DE UN ARCHIVO * * *"
	read -p "Ingrese una palabra a buscar: " palabra
	read -p "Ingrese el nombre del archivo: " archivo
	grep "$palabra" "$archivo"
	return_menu
	}
	

return_menu(){
	while true; do
	   read -p "Desea regresar al menu principal? (S/N): " opcion
	   case $opcion in 
	   [Ss] ) menu;;
	   [Nn] ) exit ;;
	   * ) echo "POr favor, ingrese S para volver al menu o N para salir";;
	   esac
	   done
	   }
	   
menu(){
	echo "* * * M E N U * * *"
	echo "1.-Listar contenido de una carpeta o fichero"
	echo "2.-Crear un archivo de texto con una linea de texto"
	echo "3.-Comparar dos archivos de texto"
	echo "4.-FUncion del comando awk"
	echo "5.-Funcion del comando grep"
	read -p "Selecciona una opcion (1-5): " opcion
	case $opcion in
	  1) listar ;;
	  2) crearArchivo ;;
	  3) compararArchivos ;;
	  4) funcion_awk ;;
	  5) funcion_grep ;;
	  *) echo "Opcion invalida, intentelo de nuevo." ;;
	  esac
	  }
	  
menu
