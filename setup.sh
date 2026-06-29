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

# Lista de dotfiles en $HOME
home_files=(
    ".bashrc"
    ".tmux.conf"
)

for file in "${home_files[@]}"; do
    src="$DOTFILES_DIR/$file"
    dest="$HOME/$file"

    # Verificar que el origen exista en la carpeta de dotfiles
    if [ ! -e "$src" ]; then
        echo "⚠️  Advertencia: El origen $src no existe. Omitiendo."
        continue
    fi

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ "$(readlink -f "$dest")" = "$src" ]; then
            echo "✅ $file ya está correctamente vinculado."
            continue
        fi

        backup="$dest.backup-$(date +%Y%m%d%H%M%S)"
        echo "📦 Creando respaldo de $file en: $backup"
        mv "$dest" "$backup"
    fi

    echo "🔗 Creando enlace simbólico para $file"
    ln -s "$src" "$dest"
done

echo ""
echo "================================================="
echo "   Configurando Entorno Mamba (mega_base)        "
echo "================================================="

ENV_NAME="mega_base"
ENV_FILE="$DOTFILES_DIR/mega_base.yml"

if [ ! -f "$ENV_FILE" ]; then
    echo "⚠️  Advertencia: No se encontró $ENV_FILE. Omitiendo configuración del entorno."
else
    # Verificar si el entorno ya existe
    if mamba env list | grep -qw "$ENV_NAME"; then
        echo "🔄 El entorno '$ENV_NAME' ya existe. Actualizando..."
        mamba env update -n "$ENV_NAME" -f "$ENV_FILE" --prune
    else
        echo "🆕 El entorno '$ENV_NAME' no existe. Creando..."
        mamba env create -f "$ENV_FILE"
    fi

    if [ $? -eq 0 ]; then
        echo "✅ Entorno '$ENV_NAME' configurado correctamente."
    else
        echo "❌ Error al configurar el entorno '$ENV_NAME'."
    fi
fi

echo ""
echo "================================================="
echo "  ¡Listo! Configuración completada con éxito.    "
echo "================================================="
