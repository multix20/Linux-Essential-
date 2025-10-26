# 🐧 NDG Linux Essentials Journey

<div align="center">

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Status](https://img.shields.io/badge/Status-In_Progress-yellow?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/multix20/Linux-Essential-?style=for-the-badge)
![GitHub repo size](https://img.shields.io/github/repo-size/multix20/Linux-Essential-?style=for-the-badge)

Mi viaje de aprendizaje en Linux: desde conceptos básicos hasta administración de sistemas

[📚 Notas](#-módulos-del-curso) · [💻 Scripts](#-scripts-destacados) · [🧪 Labs](#-laboratorios) · [📋 Cheatsheets](#-cheatsheets)

</div>

---

## 📖 Sobre este Repositorio

Este repositorio documenta mi experiencia aprendiendo Linux a través del curso **NDG Linux Essentials** de Cisco Networking Academy. Aquí encontrarás:

- 📝 Notas detalladas de cada módulo del curso
- 💻 Scripts de automatización y administración de sistemas
- 🧪 Soluciones de laboratorios y desafíos personales
- 📋 Cheatsheets y guías de referencia rápida
- 🎓 Mi progreso hacia certificaciones profesionales

## 🎯 Objetivos de Aprendizaje

- ✅ Dominar la línea de comandos de Linux
- ✅ Comprender el sistema de archivos y permisos
- ✅ Gestionar usuarios, grupos y procesos
- ✅ Automatizar tareas con bash scripting
- ✅ Administrar servicios y redes básicas
- 🔄 Preparación para RHCSA (Red Hat Certified System Administrator)

## 📚 Módulos del Curso

### ✅ Completados

| Módulo | Tema | Fecha | Notas | Lab |
|--------|------|-------|-------|-----|
| 08 | File Permissions | Oct 2025 | [📝 Ver notas](module-08-notes.md) | [🧪 Lab 08](labs/lab-08-solutions.md) |
| 09 | Process Management | Oct 2025 | [📝 Ver notas](module-09-notes.md) | [🧪 Lab 09](labs/lab-09-solutions.md) |

### 🔄 En Progreso

| Módulo | Tema | Estado |
|--------|------|--------|
| 10 | Networking Basics | 🔄 En progreso |

### ⏳ Pendientes

- Module 11: System Administration
- Module 12: Security Fundamentals
- Module 13: Advanced Shell Scripting
- Module 14: Final Project

## 💻 Scripts Destacados

### 🔍 System Health Check
```bash
./scripts/monitoring/system-health-check.sh
```
Script completo de verificación del estado del sistema con alertas configurables.

**Características:**
- Monitoreo de CPU, RAM, Disco
- Verificación de servicios críticos
- Análisis de procesos top
- Estado de red y conexiones
- Alertas con umbrales personalizables
- Reporte con colores y formato profesional

[📄 Ver código completo](scripts/monitoring/system-health-check.sh)

### 💾 Backup Automation Script
```bash
./scripts/backup/backup-script.sh
```
Sistema de respaldo automático con compresión y rotación.

**Características:**
- Respaldo incremental y completo
- Compresión con tar + gzip
- Rotación automática de backups antiguos
- Logs detallados de ejecución
- Notificaciones por email (opcional)

[📄 Ver código](scripts/backup/)

### 👥 User Management Script
```bash
./scripts/user-management/user-management.sh
```
Automatización de gestión de usuarios y grupos.

**Características:**
- Creación masiva desde CSV
- Asignación automática de grupos
- Configuración de home directories
- Generación de contraseñas seguras
- Configuración de permisos por defecto

[📄 Ver código](scripts/user-management/)

### 📊 Log Analyzer
```bash
./scripts/monitoring/log-analyzer.sh
```
Análisis y generación de reportes de logs del sistema.

**Características:**
- Parse de múltiples formatos de log
- Detección de errores críticos
- Estadísticas de uso del sistema
- Reportes exportables en HTML
- Alertas configurables por patrón

[📄 Ver código](scripts/monitoring/)

## 🧪 Laboratorios

### Labs Oficiales NDG
- [Lab 08: File Permissions Challenge](labs/lab-08-solutions.md) ✅
- [Lab 09: Process Management Exercise](labs/lab-09-solutions.md) ✅
- [Lab 10: Network Configuration](labs/lab-10-solutions.md) 🔄

### Challenge Labs (Auto-impuestos)

Desafíos adicionales para profundizar el aprendizaje:

- [🏆 Challenge 01: Secure Server Setup](labs/challenge-labs/challenge-01-secure-server.md)
  - Hardening de servidor desde cero
  - Configuración de firewall y SSH
  - Implementación de fail2ban
  
- [🏆 Challenge 02: Automated Deployment](labs/challenge-labs/challenge-02-auto-deployment.md)
  - Deploy automático de aplicaciones
  - Scripts de configuración
  - Verificación post-deployment
  
- [🏆 Challenge 03: Disaster Recovery](labs/challenge-labs/challenge-03-disaster-recovery.md)
  - Plan de recuperación
  - Backup y restore procedures
  - Testing de recuperación

## 📋 Cheatsheets

Guías de referencia rápida para consulta diaria:

| Cheatsheet | Descripción |
|-----------|-------------|
| [📁 File Permissions](cheatsheets/file-permissions.md) | chmod, chown, umask, ACLs |
| [⌨️ Common Commands](cheatsheets/common-commands.md) | Los comandos más usados diariamente |
| [🔧 Systemd Services](cheatsheets/systemd-services.md) | Gestión de servicios con systemctl |
| [🌐 Networking](cheatsheets/networking-commands.md) | ip, ss, netstat, ping, traceroute |
| [🔐 Security](cheatsheets/security-practices.md) | Best practices de seguridad |
| [📝 Vim Reference](cheatsheets/vim-reference.md) | Comandos esenciales de Vim |
| [🔄 Bash Scripting](cheatsheets/bash-scripting.md) | Sintaxis y patrones comunes |

## 🎓 Progreso y Certificaciones

### 📊 Estado Actual

```
Progreso del Curso:  ████████░░░░░░░░ 57% (8/14 módulos)
Labs Completados:    ███████████░░░░░ 75% (15/20 labs)
Scripts Creados:     ████████████████ 20 scripts funcionales
```

**Última actualización:** Octubre 26, 2025

### 🏅 Certificaciones

- [ ] NDG Linux Essentials (En progreso - 57%)
- [ ] NDG Linux Unhatched (Próximo - 2025)
- [ ] Red Hat Certified System Administrator (RHCSA) - Objetivo 2026

## 🛠️ Tecnologías y Herramientas

**Sistemas Operativos:**
- Ubuntu 22.04 LTS
- Rocky Linux 9.x
- Debian 12

**Herramientas principales:**
- Bash scripting
- Vim/Nano
- Git & GitHub
- SSH & SCP
- Cron & Systemd
- Docker (básico)

**Entorno de Práctica:**
- VirtualBox / VMware
- Homelab personal
- Cloud VMs (AWS/DigitalOcean)

## 💡 Lecciones Aprendidas

### Top 5 Conceptos que Transformaron mi Perspectiva

1. **"Everything is a file"** - La filosofía Unix que simplifica la administración
2. **Pipes y redirección** - El poder de combinar comandos simples para tareas complejas
3. **Principio de menor privilegio** - Seguridad desde el diseño
4. **Automatización > Repetición** - Un script bien hecho ahorra incontables horas
5. **Los logs nunca mienten** - La importancia del troubleshooting basado en evidencia

### Errores Comunes (y cómo los resolví)

| Error | Solución Implementada |
|-------|----------------------|
| No leer man pages | Ahora `man comando` es mi primer paso |
| Usar `rm -rf` sin verificar | Alias con confirmación: `alias rm='rm -i'` |
| No hacer backups | Scripts automáticos cada 6 horas |
| Trabajar siempre como root | sudo solo cuando es necesario |
| No documentar cambios | Sistema de changelog en todos los scripts |

## 📝 Blog y Artículos

Documentando mi experiencia de aprendizaje:

1. **[Mi transición de Educación a SysAdmin Linux](#)** - Próximamente
2. **[Lo que aprendí en mis primeros 2 meses con Linux](#)** - Próximamente
3. **[Cómo monté mi laboratorio casero de infraestructura](#)** - Próximamente
4. **[Bash scripting: De novato a automatizador](#)** - Próximamente
5. **[Mi ruta hacia la certificación RHCSA](#)** - Próximamente

**Objetivo:** 2 artículos por mes

## 🎯 Próximos Pasos

### Esta Semana
- [ ] Completar Módulo 10: Networking Basics
- [ ] Crear script de monitoreo de red
- [ ] Documentar lab de configuración LAMP stack
- [ ] Escribir primer artículo del blog

### Este Mes
- [ ] Finalizar módulos 11-14
- [ ] Crear 5 scripts adicionales de automatización
- [ ] Completar todos los challenge labs
- [ ] Preparar para examen de certificación

### Este Año
- [ ] Obtener certificación NDG Linux Essentials
- [ ] Construir homelab completo documentado
- [ ] Crear portafolio profesional en GitHub
- [ ] Comenzar preparación para RHCSA

## 📚 Recursos Complementarios

### Libros
- "The Linux Command Line" - William Shotts
- "UNIX and Linux System Administration Handbook" - Evi Nemeth
- "How Linux Works" - Brian Ward

### Cursos Online
- Linux Foundation LFS101x
- Red Hat System Administration I (RH124)
- Bash Scripting on Udemy

### Comunidades
- r/linuxadmin
- r/sysadmin  
- Linux.org forums
- Discord: Linux & Open Source

## 📊 Estructura del Repositorio

```
Linux-Essential-/
├── README.md                    # Este archivo
├── .gitignore                   # Archivos ignorados por Git
├── module-01-notes.md          # Notas de cada módulo
├── module-02-notes.md
├── ...
├── module-08-notes.md          ✅
├── module-09-notes.md          ✅
├── scripts/                     # Scripts organizados por categoría
│   ├── README.md
│   ├── backup/
│   │   └── backup-script.sh
│   ├── monitoring/
│   │   ├── system-health-check.sh ✅
│   │   └── log-analyzer.sh
│   ├── user-management/
│   │   └── user-management.sh
│   ├── security/
│   │   └── hardening-script.sh
│   ├── automation/
│   │   └── task-scheduler.sh
│   └── networking/
│       └── network-monitor.sh
├── labs/                        # Soluciones de laboratorios
│   ├── README.md
│   ├── lab-01-solutions.md
│   ├── ...
│   ├── lab-08-solutions.md     ✅
│   ├── lab-09-solutions.md     ✅
│   └── challenge-labs/
│       ├── challenge-01-secure-server.md
│       ├── challenge-02-auto-deployment.md
│       └── challenge-03-disaster-recovery.md
├── cheatsheets/                 # Guías de referencia rápida
│   ├── README.md
│   ├── file-permissions.md
│   ├── common-commands.md
│   ├── systemd-services.md
│   ├── networking-commands.md
│   ├── security-practices.md
│   ├── vim-reference.md
│   └── bash-scripting.md
├── resources/                   # Recursos adicionales
│   ├── diagrams/               # Diagramas y esquemas
│   ├── screenshots/            # Capturas de pantalla
│   └── certificates/           # Certificaciones obtenidas
└── docs/                        # Documentación adicional
    ├── setup-guides/           # Guías de instalación
    └── troubleshooting/        # Guías de solución de problemas
```

## 🤝 Contribuciones

Si encuentras errores en mis notas o tienes sugerencias para mejorar los scripts:

1. Abre un [Issue](https://github.com/multix20/Linux-Essential-/issues)
2. Envía un Pull Request
3. Comparte feedback constructivo

Toda colaboración es bienvenida para mejorar este recurso de aprendizaje.

## 📞 Conecta Conmigo

- **GitHub:** [@multix20](https://github.com/multix20)
- **LinkedIn:** [Tu Perfil](#) <!-- Agregar tu LinkedIn -->
- **Blog Personal:** [Tu Blog](#) <!-- Agregar cuando esté disponible -->
- **Email:** [tu-email@example.com](#) <!-- Agregar tu email -->

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Los scripts y documentación pueden ser usados y modificados libremente con atribución.

---

<div align="center">

### ⭐ Si este repositorio te ayuda en tu aprendizaje de Linux, considera darle una estrella ⭐

**Hecho con ❤️ y mucho ☕ mientras aprendo Linux**

*"The only way to learn a new programming language is by writing programs in it."*  
— Dennis Ritchie

</div>

---

## 🔖 Tags

`#Linux` `#Bash` `#SysAdmin` `#DevOps` `#Learning` `#NDG` `#CiscoNetAcad` `#OpenSource` `#Automation` `#CommandLine`
