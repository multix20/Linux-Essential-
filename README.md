# Menú de Control del Sistema – LPIC-1 Capítulo 101.3

Este script forma parte de la preparación para la certificación **LPIC-1**, capítulo **101.3 – Cambiar niveles de ejecución, apagar y reiniciar el sistema**.

## 🧰 Descripción

El archivo `runlevel_menu.sh` es un script interactivo que:

- Muestra el nivel de ejecución actual (`runlevel`)
- Lista usuarios conectados (`who`)
- Indica tiempo de encendido del sistema (`uptime`)
- Permite al usuario elegir entre las siguientes acciones:

  1. Apagar el sistema
  2. Reiniciar el sistema
  3. Cambiar al modo rescate (`rescue.target`)
  4. Cambiar al modo multiusuario (`multi-user.target`)
  5. Salir del script

## 💻 Uso

### 1. Asignar permisos de ejecución

```bash
chmod +x runlevel_menu.sh
