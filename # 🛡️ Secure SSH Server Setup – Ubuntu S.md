# 🛡️ Secure SSH Server Setup – Ubuntu Server (Manual de Juan Pablo Monsalve Suazo)

> Configuración segura de un servidor Ubuntu para acceso SSH como administrador de sistemas Linux (SysAdmin), desde cero hasta producción segura.

---

## 💻 1. Requisitos iniciales

* Ubuntu Server instalado (ej: 24.04 LTS)
* Acceso físico o por consola virtual
* Conexión a internet
* Interfaz de red: `enp0s3`
* Usuario creado: `multix`

---

## 🌐 2. Asignar IP Fija (Netplan)

Editar el archivo:

```bash
sudo nano /etc/netplan/50-cloud-init.yaml
```

Contenido:

```yaml
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.0.9/24
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
      routes:
        - to: 0.0.0.0/0
          via: 192.168.0.1
```

Aplicar cambios:

```bash
sudo netplan apply
```

---

## 🔐 3. Acceso SSH por clave pública

Desde máquina local (Windows):

```powershell
ssh-keygen -t ed25519 -C "juanpablo@tuemail.com"
type $env:USERPROFILE\.ssh\id_ed25519.pub
```

En el servidor:

```bash
mkdir -p ~/.ssh
nano ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

---

## 🔄 4. Cambiar el puerto de SSH

Editar:

```bash
sudo nano /etc/ssh/sshd_config
```

Cambiar:

```text
#Port 22
Port 4433
PermitRootLogin no
PasswordAuthentication no
```

Reiniciar SSH:

```bash
sudo systemctl restart ssh
```

---

## 🧱 5. Configurar Firewall (UFW)

```bash
sudo apt install ufw
sudo ufw allow 4433/tcp
sudo ufw enable
sudo ufw status
```

---

## 🚔 6. Instalar y activar Fail2Ban

```bash
sudo apt install fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

Ver estado:

```bash
sudo fail2ban-client status
sudo fail2ban-client status sshd
```

---

## ✅ Estado Final del Servidor

| Componente            | Estado   |
| --------------------- | -------- |
| IP fija               | ✅        |
| SSH por clave         | ✅        |
| Puerto personalizado  | ✅ `4433` |
| Acceso por contraseña | ❌        |
| Firewall activo       | ✅        |
| Fail2Ban funcionando  | ✅        |

---

## 🧪 Validaciones finales

```bash
sudo ss -tnlp | grep ssh
sudo ufw status
```

---

Documentado por: **Juan Pablo Monsalve Suazo**
Fecha: julio 2025
