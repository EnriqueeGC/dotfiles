#!/bin/bash

USER=$(logname)

DOTFILES_DIR="/home/$USER/dotfiles"
QTILE_SRC="$DOTFILES_DIR/qtile"
CONFIG_DIR="/home/$USER/.config"
QTILE_DEST="$CONFIG_DIR/qtile"

if [ -d "$DOTFLES_DIR" ]; then
    echo "La carpeta qtile encontrada en: $DOTFILES_DIR"

    if [ ! -d "$CONFIG_DIR" ]; then
        echo "el directoro .config no existe..... creandolo"
        mkdir -p "$CONFIG_DIR"
    fi

    cp -r "$QTILE_SRC" "$QTILE_DEST" 
    echo "la carpeta qtile se copio exitosamente"
else
    echo "Error: la carpetea qtile no se encuentra en $QTILE_DIR"
    exit 1
fi