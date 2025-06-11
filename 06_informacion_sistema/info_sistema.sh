#!/bin/bash
set -euo pipefail

usage() {
    echo "Uso: $0 [-h|--help]" >&2
    echo "Muestra informaci\u00f3n sobre disco, memoria y red." >&2
}

case "${1:-}" in
    -h|--help)
        usage
        exit 0
        ;;
    "")
        ;;
    *)
        echo "Opción desconocida: $1" >&2
        usage
        exit 1
        ;;

esac

echo "==== Uso de disco ===="
df -h

echo "==== Uso de memoria ===="
free -h

echo "==== Interfaces de red ===="
ip -br addr

