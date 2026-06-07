#!/usr/bin/env bash

# Script para instalar/vincular los dotfiles
# Autor: Antigravity

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

echo "================================================="
echo "   Instalando Enlaces Simbólicos (Symlinks)     "
echo "================================================="

# Asegurarse de que el directorio ~/.config exista
mkdir -p "$CONFIG_DIR"

# Lista de configuraciones a vincular
configs=(
    "nvim"
    "yazi"
    "lazygit"
    "fastfetch"
    "starship.toml"
)

for config in "${configs[@]}"; do
    src="$DOTFILES_DIR/$config"
    dest="$CONFIG_DIR/$config"

    # Verificar que el origen exista en la carpeta de dotfiles
    if [ ! -e "$src" ]; then
        echo "⚠️  Advertencia: El origen $src no existe. Omitiendo."
        continue
    fi

    # Verificar si el destino ya existe en ~/.config/
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        # Si ya apunta al lugar correcto, no hacer nada
        if [ "$(readlink -f "$dest")" = "$src" ]; then
            echo "✅ $config ya está correctamente vinculado."
            continue
        fi

        # Crear respaldo si ya existe un archivo/carpeta diferente
        backup="$dest.backup-$(date +%Y%m%d%H%M%S)"
        echo "📦 Creando respaldo de la configuración existente en: $backup"
        mv "$dest" "$backup"
    fi

    # Crear el enlace simbólico
    echo "🔗 Creando enlace simbólico: $config -> $dest"
    ln -s "$src" "$dest"
done

# Vincular .bashrc
BASHRC_SRC="$DOTFILES_DIR/.bashrc"
BASHRC_DEST="$HOME/.bashrc"

if [ -e "$BASHRC_DEST" ] || [ -L "$BASHRC_DEST" ]; then
    if [ "$(readlink -f "$BASHRC_DEST")" != "$BASHRC_SRC" ]; then
        backup="$BASHRC_DEST.backup-$(date +%Y%m%d%H%M%S)"
        echo "📦 Creando respaldo de .bashrc en: $backup"
        mv "$BASHRC_DEST" "$backup"
        echo "🔗 Creando enlace simbólico para .bashrc"
        ln -s "$BASHRC_SRC" "$BASHRC_DEST"
    else
        echo "✅ .bashrc ya está correctamente vinculado."
    fi
else
    echo "🔗 Creando enlace simbólico para .bashrc"
    ln -s "$BASHRC_SRC" "$BASHRC_DEST"
fi

echo "================================================="
echo "  ¡Listo! Configuración completada con éxito.    "
echo "================================================="
