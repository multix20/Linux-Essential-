#!/bin/bash
set -euo pipefail

usage() {
    echo "Uso: $0 [-h|--help]" >&2
    echo "Muestra la configuración IP actual." >&2
}

case "${1:-}" in
    -h|--help)
        usage
        exit 0
        ;;
esac

# Script de ejemplo para mostrar la IP actual
ip a
