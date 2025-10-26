# 📋 File Permissions Cheatsheet

## Notación Numérica

| Decimal | Binario | Permisos |
|---------|---------|----------|
| 7 | 111 | rwx |
| 6 | 110 | rw- |
| 5 | 101 | r-x |
| 4 | 100 | r-- |
| 3 | 011 | -wx |
| 2 | 010 | -w- |
| 1 | 001 | --x |
| 0 | 000 | --- |

## Ejemplos Comunes
```bash
chmod 755 script.sh    # rwxr-xr-x
chmod 644 file.txt     # rw-r--r--
chmod 600 secret.key   # rw-------
chmod 700 private_dir  # rwx------
```

## Permisos Especiales
```bash
# SUID
chmod u+s /usr/bin/program

# SGID
chmod g+s /shared/directory

# Sticky Bit
chmod +t /tmp
```
