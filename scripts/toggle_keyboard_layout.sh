#!/bin/bash

# Lista de layouts disponibles (puedes agregar más si lo necesitas)
layouts=("us" "es")

# Obtener el layout actual
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Buscar el índice del layout actual en la lista
for i in "${!layouts[@]}"; do
  if [[ "${layouts[$i]}" == "$current_layout" ]]; then
    # Calcular el índice del próximo layout
    next_layout=$(( (i + 1) % ${#layouts[@]} ))
    # Cambiar al próximo layout
    setxkbmap "${layouts[$next_layout]}"
    exit 0
  fi
done
