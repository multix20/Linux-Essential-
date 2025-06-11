#!/bin/bash
set -euo pipefail

usage() {
    echo "Uso: $0 [-h|--help]" >&2
    echo "Muestra un listado de archivos y la ruta actual." >&2
}

case "${1:-}" in
    -h|--help)
        usage
        exit 0
        ;;
esac

echo "Listando archivos..."
ls -la
pwd
tree
