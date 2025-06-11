#!/bin/bash
set -euo pipefail

usage() {
    echo "Uso: $0 [-h|--help]" >&2
    echo "Crea el usuario llamado 'ejemplo'." >&2
}

case "${1:-}" in
    -h|--help)
        usage
        exit 0
        ;;
esac

# Script de ejemplo para crear un usuario
sudo adduser ejemplo
