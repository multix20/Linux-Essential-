#!/bin/bash

# Script de respaldo simple
# LPIC-1 Capítulo 101.5 – Creación de scripts simples
# Autor: Juan Pablo Monsalve Suazo

LOGFILE="respaldo.log"

echo "========== SCRIPT DE BACKUP SIMPLE =========="

read -rp "📁 Carpeta de origen a respaldar: " origen
read -rp "📁 Carpeta de destino para guardar el backup: " destino

# Validar existencia de origen
if [ ! -d "$origen" ]; then
  echo "❌ La carpeta de origen no existe: $origen"
  exit 1
fi

# Validar existencia de destino
if [ ! -d "$destino" ]; then
  echo "❌ La carpeta de destino no existe: $destino"
  exit 1
fi

# Crear nombre del archivo comprimido
fecha=$(date +"%Y%m%d-%H%M%S")
nombre_backup="backup-$fecha.tar.gz"

# Crear respaldo
echo "🔄 Comprimiendo..."
tar -czf "$destino/$nombre_backup" -C "$origen" .

# Verificar éxito
if [ $? -eq 0 ]; then
  echo "✅ Backup creado: $destino/$nombre_backup"
  echo "[$(date "+%Y-%m-%d %H:%M:%S")] Backup de '$origen' guardado en '$destino/$nombre_backup'" >> "$LOGFILE"
else
  echo "❌ Error al crear el backup"
  exit 1
fi
