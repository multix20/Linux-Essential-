#!/bin/bash

LOGFILE="paquetes.log"

echo "========== GESTOR DE PAQUETES DEBIAN =========="

echo "1) Verificar si un paquete está instalado"
echo "2) Instalar un paquete"
echo "3) Eliminar un paquete"
echo "4) Mostrar archivos instalados por un paquete"
echo "5) Salir"

read -rp "Seleccione una opción [1-5]: " opcion

log() {
  echo "[$(date "+%Y-%m-%d %H:%M:%S")] $1" >> "$LOGFILE"
}

case $opcion in
  1)
    read -rp "Ingrese el nombre del paquete a verificar: " pkg
    dpkg -s "$pkg" &> /dev/null && echo "✅ El paquete '$pkg' está instalado." || echo "❌ El paquete '$pkg' NO está instalado."
    log "Verificación del paquete '$pkg'"
    ;;
  2)
    read -rp "Ingrese el nombre del paquete a instalar: " pkg
    sudo apt update && sudo apt install -y "$pkg"
    log "Instalación del paquete '$pkg'"
    ;;
  3)
    read -rp "Ingrese el nombre del paquete a eliminar: " pkg
    sudo apt remove -y "$pkg"
    log "Eliminación del paquete '$pkg'"
    ;;
  4)
    read -rp "Ingrese el nombre del paquete para ver su contenido: " pkg
    dpkg -L "$pkg"
    log "Listado de archivos del paquete '$pkg'"
    ;;
  5)
    echo "Saliendo..."
    log "Script finalizado por el usuario"
    exit 0
    ;;
  *)
    echo "Opción inválida"
    ;;
esac
