# 🗃️ Script de Backup Simple – LPIC-1 Capítulo 103.1

> Automatiza respaldos locales en sistemas Linux usando Bash

![bash-logo](https://img.shields.io/badge/Shell-Bash-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![lpic1](https://img.shields.io/badge/LPIC--1%20Practica-Cap%C3%ADtulo%20103.1-blueviolet?style=for-the-badge)
![status](https://img.shields.io/badge/Estado-100%25%20Completado-brightgreen?style=for-the-badge)

---

## 📌 Descripción del Proyecto

Este script automatiza el respaldo comprimido (`.tar.gz`) de una carpeta de origen a una carpeta de destino, registrando cada acción en un log.

Se alinea con el **objetivo 103.1 de la certificación LPIC-1**: _“Trabajar desde la línea de comandos”_, enfocándose en el uso de Bash, condicionales, variables y comandos básicos.

---

## 🧠 Contenidos LPIC-1 abordados

- Uso de comandos GNU y Unix (`echo`, `read`, `tar`, `date`, `if`, `exit`)
- Redirección y creación de logs (`>> log.txt`)
- Interacción con el usuario
- Composición de scripts funcionales con validaciones básicas

---

## 📁 Estructura esperada del proyecto

```
lpic1-comandos/
├── backup_rapido.sh         # Script ejecutable en Bash
├── origen/                  # Carpeta de prueba con archivos de respaldo
├── destino/                 # Carpeta donde se almacenan los backups
├── respaldo.log             # Registro de actividades con fecha
└── README.md                # Este archivo
```

---

## ⚙️ Funcionalidades del Script

| Funcionalidad                        | Estado   |
|-------------------------------------|----------|
| Solicita carpetas de origen y destino | ✅ OK     |
| Valida si existen las carpetas       | ✅ OK     |
| Genera archivo comprimido con fecha  | ✅ OK     |
| Registra actividad en `respaldo.log` | ✅ OK     |

---

## ▶️ Ejecución

```bash
chmod +x backup_rapido.sh
./backup_rapido.sh
```

### 💬 Ejemplo de uso:

```
📁 Carpeta de origen a respaldar: origen
📁 Carpeta de destino para guardar el backup: destino
🔄 Comprimiendo...
✅ Backup creado: destino/backup-20250518-190305.tar.gz
```

### 📝 Log generado (`respaldo.log`):

```
[2025-05-18 19:03:05] Backup de 'origen' guardado en 'destino/backup-20250518-190305.tar.gz'
```

---

## 🖼️ (Opcional) Captura de pantalla

Puedes agregar aquí una imagen del script funcionando en la terminal:

```markdown
![screenshot](./screenshot.png)
```

---

## 👨‍💻 Autor

Desarrollado por **Juan Pablo Monsalve Suazo**

📘 [Ver progreso completo en LPIC-1](https://github.com/multix20/multix20/blob/main/PROGRESO.md)

✉️ [jp.devtravel@gmail.com](mailto:jp.devtravel@gmail.com)

---

> Este proyecto es parte de una ruta práctica hacia la certificación LPIC-1. Más información y evidencias disponibles en mis repositorios LPIC-1.
