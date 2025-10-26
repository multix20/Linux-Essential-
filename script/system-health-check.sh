#!/bin/bash
#
# Script: system-health-check.sh
# Descripción: Chequeo rápido de salud del sistema con alertas
# Autor: multix20
# Fecha: Octubre 2025
# Versión: 1.0
# 
# Uso: ./system-health-check.sh
# Requisitos: bash 4+, comandos estándar Linux
#
# Probado en:
#   - Ubuntu 22.04 LTS
#   - Rocky Linux 9.x
#   - Debian 12
#

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuración de umbrales
MEMORY_THRESHOLD=80
DISK_THRESHOLD=85
LOAD_THRESHOLD=2.0

# Función: Banner
print_banner() {
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}    SYSTEM HEALTH CHECK v1.0${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
}

# Función: Información básica del sistema
print_system_info() {
    echo -e "${GREEN}📌 INFORMACIÓN BÁSICA${NC}"
    echo "Hostname:     $(hostname)"
    
    if [ -f /etc/os-release ]; then
        OS=$(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)
        echo "OS:           $OS"
    fi
    
    echo "Kernel:       $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Uptime:       $(uptime -p 2>/dev/null || uptime)"
    echo ""
}

# Función: Uso de CPU
check_cpu() {
    echo -e "${GREEN}💻 CPU USAGE${NC}"
    
    # CPU model
    if [ -f /proc/cpuinfo ]; then
        CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2 | xargs)
        CPU_CORES=$(grep -c "processor" /proc/cpuinfo)
        echo "CPU:          $CPU_MODEL"
        echo "Cores:        $CPU_CORES"
    fi
    
    # CPU load
    if command -v top &> /dev/null; then
        CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
        echo "CPU Load:     ${CPU_USAGE}% (user)"
        
        # Alert si carga es muy alta
        if (( $(echo "$CPU_USAGE > 90" | bc -l 2>/dev/null || echo 0) )); then
            echo -e "${RED}⚠️  WARNING: High CPU usage!${NC}"
        fi
    fi
    
    # Load average
    LOAD=$(uptime | awk -F'load average:' '{print $2}' | xargs)
    echo "Load Average: $LOAD"
    echo ""
}

# Función: Uso de memoria
check_memory() {
    echo -e "${GREEN}🧠 MEMORY USAGE${NC}"
    
    if command -v free &> /dev/null; then
        # Información básica
        free -h | grep Mem | awk '{print "Total:        " $2 "\nUsed:         " $3 "\nFree:         " $4 "\nAvailable:    " $7}'
        
        # Calcular porcentaje
        MEMORY_PERCENT=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
        echo "Usage:        ${MEMORY_PERCENT}%"
        
        # Alert según threshold
        if [ "$MEMORY_PERCENT" -gt "$MEMORY_THRESHOLD" ]; then
            echo -e "${RED}⚠️  WARNING: Memory usage at ${MEMORY_PERCENT}% (threshold: ${MEMORY_THRESHOLD}%)${NC}"
        else
            echo -e "${GREEN}✅ Memory usage normal${NC}"
        fi
        
        # Swap
        SWAP_TOTAL=$(free -h | grep Swap | awk '{print $2}')
        SWAP_USED=$(free -h | grep Swap | awk '{print $3}')
        echo "Swap:         $SWAP_USED / $SWAP_TOTAL"
        
        # Alert si hay swap usage significativo
        SWAP_PERCENT=$(free | grep Swap | awk '{if($2>0) printf "%.0f", $3/$2 * 100; else print "0"}')
        if [ "$SWAP_PERCENT" -gt 50 ]; then
            echo -e "${YELLOW}⚠️  WARNING: Swap usage at ${SWAP_PERCENT}%${NC}"
        fi
    fi
    echo ""
}

# Función: Uso de disco
check_disk() {
    echo -e "${GREEN}💾 DISK USAGE${NC}"
    
    if command -v df &> /dev/null; then
        # Mostrar uso de disco de las particiones principales
        df -h | grep -E '^/dev/' | while read -r line; do
            FILESYSTEM=$(echo "$line" | awk '{print $1}')
            SIZE=$(echo "$line" | awk '{print $2}')
            USED=$(echo "$line" | awk '{print $3}')
            AVAIL=$(echo "$line" | awk '{print $4}')
            USE_PERCENT=$(echo "$line" | awk '{print $5}' | tr -d '%')
            MOUNT=$(echo "$line" | awk '{print $6}')
            
            echo "Mount:        $MOUNT"
            echo "Filesystem:   $FILESYSTEM"
            echo "Size:         $SIZE"
            echo "Used:         $USED"
            echo "Available:    $AVAIL"
            echo "Usage:        ${USE_PERCENT}%"
            
            # Alert según threshold
            if [ "$USE_PERCENT" -gt "$DISK_THRESHOLD" ]; then
                echo -e "${RED}⚠️  WARNING: Disk usage at ${USE_PERCENT}% (threshold: ${DISK_THRESHOLD}%)${NC}"
            else
                echo -e "${GREEN}✅ Disk usage normal${NC}"
            fi
            echo ""
        done
    fi
}

# Función: Servicios críticos
check_services() {
    echo -e "${GREEN}🔧 CRITICAL SERVICES${NC}"
    
    # Lista de servicios comunes a verificar
    SERVICES=("sshd" "systemd-logind" "cron" "rsyslog")
    
    for service in "${SERVICES[@]}"; do
        if command -v systemctl &> /dev/null; then
            if systemctl is-active --quiet "$service" 2>/dev/null; then
                echo -e "✅ $service: ${GREEN}running${NC}"
            else
                # Verificar si el servicio existe
                if systemctl list-unit-files | grep -q "^$service"; then
                    echo -e "❌ $service: ${RED}stopped${NC}"
                fi
            fi
        fi
    done
    echo ""
}

# Función: Procesos que consumen más recursos
check_top_processes() {
    echo -e "${GREEN}📊 TOP PROCESSES (CPU)${NC}"
    
    if command -v ps &> /dev/null; then
        ps aux --sort=-%cpu | head -6 | awk 'NR==1 {print "USER       PID    %CPU  %MEM  COMMAND"} NR>1 {printf "%-10s %-6s %-5s %-5s %s\n", $1, $2, $3, $4, $11}'
    fi
    echo ""
    
    echo -e "${GREEN}📊 TOP PROCESSES (MEMORY)${NC}"
    if command -v ps &> /dev/null; then
        ps aux --sort=-%mem | head -6 | awk 'NR==1 {print "USER       PID    %CPU  %MEM  COMMAND"} NR>1 {printf "%-10s %-6s %-5s %-5s %s\n", $1, $2, $3, $4, $11}'
    fi
    echo ""
}

# Función: Conexiones de red
check_network() {
    echo -e "${GREEN}🌐 NETWORK STATUS${NC}"
    
    # Interfaces activas
    if command -v ip &> /dev/null; then
        echo "Active Interfaces:"
        ip -br addr | grep UP | awk '{print "  " $1 " - " $3}'
    elif command -v ifconfig &> /dev/null; then
        echo "Active Interfaces:"
        ifconfig | grep -E '^[a-z]|inet ' | grep -A1 UP | grep -v '\-\-'
    fi
    echo ""
    
    # Conexiones establecidas
    if command -v ss &> /dev/null; then
        ESTABLISHED=$(ss -tan | grep ESTAB | wc -l)
        echo "Established Connections: $ESTABLISHED"
    elif command -v netstat &> /dev/null; then
        ESTABLISHED=$(netstat -tan | grep ESTABLISHED | wc -l)
        echo "Established Connections: $ESTABLISHED"
    fi
    echo ""
}

# Función: Últimos logins
check_last_logins() {
    echo -e "${GREEN}👤 RECENT LOGINS${NC}"
    
    if command -v last &> /dev/null; then
        last -n 5 | head -5
    fi
    echo ""
}

# Función: Verificar actualizaciones pendientes
check_updates() {
    echo -e "${GREEN}📦 SYSTEM UPDATES${NC}"
    
    if command -v apt &> /dev/null; then
        # Debian/Ubuntu
        UPDATES=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
        if [ "$UPDATES" -gt 0 ]; then
            echo -e "${YELLOW}⚠️  $UPDATES package updates available${NC}"
        else
            echo -e "${GREEN}✅ System is up to date${NC}"
        fi
    elif command -v dnf &> /dev/null; then
        # RHEL/Rocky/Fedora
        UPDATES=$(dnf check-update -q | grep -v '^$' | wc -l)
        if [ "$UPDATES" -gt 0 ]; then
            echo -e "${YELLOW}⚠️  $UPDATES package updates available${NC}"
        else
            echo -e "${GREEN}✅ System is up to date${NC}"
        fi
    elif command -v yum &> /dev/null; then
        # CentOS/RHEL older
        UPDATES=$(yum check-update -q | grep -v '^$' | wc -l)
        if [ "$UPDATES" -gt 0 ]; then
            echo -e "${YELLOW}⚠️  $UPDATES package updates available${NC}"
        else
            echo -e "${GREEN}✅ System is up to date${NC}"
        fi
    fi
    echo ""
}

# Función: Resumen final
print_summary() {
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}    HEALTH CHECK COMPLETED${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo "Report generated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
}

# Main execution
main() {
    clear
    print_banner
    print_system_info
    check_cpu
    check_memory
    check_disk
    check_services
    check_top_processes
    check_network
    check_last_logins
    check_updates
    print_summary
}

# Ejecutar script
main