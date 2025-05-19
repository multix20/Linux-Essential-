q# LPIC-1 Proyecto Capítulo 101.3
# Tema: Cambiar niveles de ejecución, apagar y reiniciar el sistema
# Autor: Juan Pablo Monsalve Suazo

#!/bin/bash

main() {
  echo "========== ESTADO ACTUAL DEL SISTEMA =========="
  echo -e "\n> Nivel de ejecución actual (runlevel):"
  runlevel

  echo -e "\n> Usuarios conectados:"
  who

  echo -e "\n> Tiempo encendido (uptime):"
  uptime

  echo -e "\n========== ACCIONES DISPONIBLES =========="
  echo "1) Apagar el sistema"
  echo "2) Reiniciar el sistema"
  echo "3) Cambiar a modo rescate (rescue.target)"
  echo "4) Cambiar a modo multiusuario (multi-user.target)"
  echo "5) Salir"

  read -rp $'\nSeleccione una opción [1-5]: ' opcion

  case $opcion in
    1)
      echo "Apagando el sistema..."
      sudo shutdown -h now
      ;;
    2)
      echo "Reiniciando el sistema..."
      sudo reboot
      ;;
    3)
      echo "Cambiando a modo rescate..."
      sudo systemctl isolate rescue.target
      ;;
    4)
      echo "Cambiando a modo multiusuario..."
      sudo systemctl isolate multi-user.target
      ;;
    5)
      echo "Saliendo..."
      exit 0
      ;;
    *)
      echo "Opción inválida"
      ;;
  esac
}

main
