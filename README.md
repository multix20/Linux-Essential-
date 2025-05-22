<<<<<<< HEAD
# LPIC-1: Guía de Estudio Modular

Este repositorio contiene materiales prácticos y organizados por módulos temáticos, creados para apoyar el estudio y preparación de la certificación **LPIC-1 (Linux Professional Institute Certification - Nivel 1)**.

Cada carpeta incluye scripts, comandos útiles, ejercicios y notas relacionadas con los temas oficiales del examen 101.

---

## 📁 Estructura del Repositorio

- `comandos/` – Práctica con comandos GNU/Linux (tema 103.1 y 103.2).
- `runlevels/` – Cambios de nivel de ejecución y systemd (tema 101.3).
- `paquetes/` – Gestión de paquetes con `dpkg`, `apt`, `rpm`, `yum`, `zypper` (tema 102.5).
- `hardware/` – Reconocimiento y configuración de hardware, módulos del kernel y arranque del sistema (temas 101.1 y 101.2).

---

## 📌 Objetivo

Centralizar la práctica modular del contenido de LPIC-1 para facilitar repasos, automatizaciones básicas y la integración de conocimientos fundamentales en Linux.

---

## ✅ Requisitos Previos

- Conocimientos básicos de línea de comandos.
- Terminal Bash o shell compatible.
- Linux Debian/Ubuntu o derivados para ejecutar los scripts sin modificar.

---

## 🧠 Inspiración

Este repositorio es parte del proyecto autodidacta **multix20**, con el objetivo de conseguir empleo como SysAdmin Linux en menos de 2 años, utilizando Linux de forma profesional (Ubuntu y Red Hat).

---

## 🛠️ Tecnologías Relevantes

[![Linux](https://img.shields.io/badge/Linux-Ubuntu%2FRHEL-black?logo=linux)](https://linux.org)
[![Shell](https://img.shields.io/badge/Scripting-Bash-blue?logo=gnubash)](https://gnu.org)
[![Git](https://img.shields.io/badge/Version%20Control-Git-orange?logo=git)](https://git-scm.com)

---

## 🔗 Enlaces de Interés

- [Linux Professional Institute (LPI)](https://www.lpi.org/)
- [Temario LPIC-1](https://www.lpi.org/our-certifications/lpic-1-overview)
- [Repositorio oficial del proyecto Multix](https://github.com/multix20)

---

## 🧾 Licencia

Este contenido está publicado bajo la licencia [MIT](LICENSE).

=======
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
>>>>>>> paquetes/main
