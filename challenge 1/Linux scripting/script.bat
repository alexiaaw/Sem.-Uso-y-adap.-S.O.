#!/bin/bash

# Verificar que se hayan proporcionado todos los argumentos
if [ $# -ne 6 ]; then
    echo "Uso: $0 <Nombre_VM> <Tipo_SO> <CPUs> <Memoria_GB> <VRAM_MB> <Tamaño_Disco_GB>"
    exit 1
fi

# Asignar los argumentos a variables
nombre_vm=$1
tipo_so=$2
cpus=$3
memoria_gb=$4
vram_mb=$5
tamano_disco_gb=$6

# Crear la máquina virtual
VBoxManage createvm --name "$nombre_vm" --ostype "$tipo_so" --register

# Configurar los componentes de la máquina virtual
VBoxManage modifyvm "$nombre_vm" --cpus "$cpus"
VBoxManage modifyvm "$nombre_vm" --memory "$memoria_gb"GB
VBoxManage modifyvm "$nombre_vm" --vram "$vram_mb"
VBoxManage createmedium disk --filename "$nombre_vm.vdi" --size "$tamano_disco_gb"GB --format VDI
VBoxManage storagectl "$nombre_vm" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$nombre_vm" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"
VBoxManage storagectl "$nombre_vm" --name "IDE Controller" --add ide --controller PIIX4

# Imprimir la configuración de la máquina virtual
echo "Configuración de la máquina virtual $nombre_vm:"
VBoxManage showvminfo "$nombre_vm"
