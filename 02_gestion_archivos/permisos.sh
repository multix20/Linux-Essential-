#!/bin/bash
set -euo pipefail

usage() {
    echo "Uso: $0 [-h|--help]" >&2
    echo "Crea el archivo permisos.txt y establece permisos 754." >&2
}

case "${1:-}" in
    -h|--help)
        usage
        exit 0
        ;;
esac

touch permisos.txt
chmod 754 permisos.txt
ls -l permisos.txt
