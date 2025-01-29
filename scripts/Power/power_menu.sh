#!/bin/bash

# Obtener tiempo activo del sistema
uptime=$(uptime -p | sed -e 's/up //g')
dir="$HOME/.config/rofi/"
rofi_command="rofi -theme $dir/power.rasi"

# Opciones
terminal=""
shutdown="󰐥"
reboot="󰜉"
suspend="󰒲"
lock=""
logout=""

options="$terminal\n$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Mostrar el menú con Rofi
chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        # Cambia el comando a tu bloqueador preferido, por ejemplo `betterlockscreen` o `i3lock`
        betterlockscreen -l
        ;;
    $suspend)
        # Pausar música y suspender
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        # Cerrar sesión en Qtile
        qtile cmd-obj -o cmd -f shutdown
        ;;
    $terminal)
        # Abrir terminal (reemplaza 'kitty' con tu terminal preferida)
        kitty
        ;;
esac
