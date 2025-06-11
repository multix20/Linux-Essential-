#!/bin/bash
set -euo pipefail

usage() {
    echo "Uso: $0 [ORIGEN] [DESTINO]" >&2
    echo "Realiza una copia de seguridad usando rsync." >&2
    echo "Si no se especifican rutas se usan /etc y /home/usuario/backup." >&2
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    usage
    exit 0
fi

SRC=${1:-/etc}
DST=${2:-/home/usuario/backup}

if [[ ! -d "$SRC" ]]; then
    echo "Error: el directorio origen '$SRC' no existe." >&2
    exit 1
fi

if [[ ! -d "$DST" ]]; then
    echo "Creando directorio destino '$DST'." >&2
    mkdir -p "$DST"
fi

rsync -av --delete "$SRC" "$DST"
