#!/bin/bash

# Verificar el número correcto de argumentos
if [ "$#" -ne 6 ]; then
    echo "Uso: $0 <Nombre_VM> <CPUs> <Memoria_GB> <VRAM_MB> <Tamaño_Disco_GB>"
    exit 1
fi

# Obtener los argumentos
NOMBRE_VM="$1"
CPUS="$2"
MEMORIA_GB="$3"
VRAM_MB="$4"
TAMAÑO_DISCO_GB="$5"

# Crear la máquina virtual
VBoxManage createvm --name "$NOMBRE_VM" --register

# Configurar la máquina virtual
VBoxManage modifyvm "$NOMBRE_VM" --cpus "$CPUS" --memory "$MEMORIA_GB" --vram "$VRAM_MB"

# Crear y adjuntar el disco duro virtual
VBoxManage createmedium disk --filename "$NOMBRE_VM.vdi" --size "$TAMAÑO_DISCO_GB"

VBoxManage storagectl "$NOMBRE_VM" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$NOMBRE_VM" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$NOMBRE_VM.vdi"

# Mostrar la configuración de la máquina virtual
VBoxManage showvminfo "$NOMBRE_VM"

echo "Máquina virtual '$NOMBRE_VM' creada y configurada correctamente."

