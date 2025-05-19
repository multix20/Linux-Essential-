# 📦 Gestor de Paquetes Debian – LPIC-1 Capítulo 101.4

Este proyecto forma parte del avance práctico en la certificación **LPIC-1**, capítulo **101.4 – Gestión de paquetes Debian**.

## 🔧 Descripción

Este script en Bash proporciona un menú interactivo para gestionar paquetes en sistemas basados en Debian.

### Funciones disponibles:

1. ✅ Verificar si un paquete está instalado (`dpkg -s`)
2. ✅ Instalar un paquete con `apt`
3. ✅ Eliminar un paquete (`apt remove`)
4. ✅ Mostrar los archivos que un paquete ha instalado (`dpkg -L`)
5. ❌ Salir del programa

Cada acción ejecutada se registra automáticamente en un archivo `paquetes.log` con fecha y hora.

## ▶️ Cómo usar

### 1. Asignar permisos de ejecución

```bash
chmod +x gestor_paquetes.sh
```

### 2. Ejecutar el script

```bash
./gestor_paquetes.sh
```

> ⚠️ Algunas funciones requieren permisos de administrador (`sudo`).

## 🧠 Contenidos LPIC-1 relacionados

- `dpkg`, `apt`, `apt-get`
- Listado, instalación, y eliminación de paquetes
- Consulta de contenido de paquetes instalados

## 📁 Archivos incluidos

- `gestor_paquetes.sh` – script interactivo
- `paquetes.log` – registro de acciones realizadas (se crea automáticamente)

---

Desarrollado por **Juan Pablo Monsalve Suazo** como parte de su preparación para certificación Linux Profesional LPIC-1.
