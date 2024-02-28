#!/bin/bash

# Crea un archivo de texto con una cadena
echo "Hola Mundo" > mytext.txt

# Despliega el contenido del archivo mytext
cat mytext.txt

# Crea un directorio llamado backup
mkdir backup

# Mueve el archivo mytext al directorio backup
mv mytext.txt backup/

# Lista el contenido del directorio backup
ls backup

# Elimina el archivo mytext del directorio backup
rm backup/mytext.txt

# Elimina el directorio backup
rmdir backup
