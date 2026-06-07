# 📂 Mis Dotfiles

Este repositorio contiene mis archivos de configuración personales para un entorno de desarrollo eficiente en Linux/macOS.

## 🛠️ Herramientas Incluidas

- **Neovim (`nvim`)**: Editor de texto rápido y altamente extensible.
- **Yazi (`yazi`)**: Explorador de archivos para terminal ultrarrápido escrito en Rust.
- **Lazygit (`lazygit`)**: Interfaz gráfica en terminal para Git.
- **Starship (`starship.toml`)**: Prompt personalizable, rápido y minimalista para tu shell.
- **Fastfetch**: (Opcional) Utilidad para mostrar información del sistema con estilo.

---

## 🚀 Instalación en una nueva PC

Para aplicar estas configuraciones en una nueva máquina, sigue estos pasos:

### 1. Clonar el repositorio
Clona este repositorio directamente en tu directorio principal (`HOME`) como la carpeta `dotfiles`:

```bash
git clone <URL_DE_TU_REPOSITORIO> ~/dotfiles
```

### 2. Ejecutar el Script de Instalación
Hemos incluido un script (`setup.sh`) que realiza las siguientes tareas de forma segura:
1. Crea la carpeta `~/.config` si no existe.
2. Si ya tienes configuraciones previas (por ejemplo, una carpeta `~/.config/nvim` existente), crea una copia de seguridad con fecha y hora para evitar que pierdas información.
3. Genera los enlaces simbólicos (hologramas) de manera automática.

Para ejecutarlo, corre:

```bash
# Dar permisos de ejecución al script
chmod +x ~/dotfiles/setup.sh

# Ejecutar el instalador
~/dotfiles/setup.sh
```

---

## 🔗 Instalación Manual (Symlinks)

Si prefieres realizar el proceso manualmente o sin usar el script, ejecuta los siguientes comandos en tu terminal:

```bash
# Crear la carpeta de configuraciones si no existe
mkdir -p ~/.config

# Enlaces simbólicos para directorios de configuración
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/yazi ~/.config/yazi
ln -s ~/dotfiles/lazygit ~/.config/lazygit

# Enlaces simbólicos para archivos sueltos
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```

---

## 📦 Dependencias Necesarias

Asegúrate de instalar los programas correspondientes en tu nueva máquina para que las configuraciones surtan efecto:

### Arch Linux / EndeavourOS:
```bash
sudo pacman -S neovim yazi lazygit starship fastfetch
```

### Debian / Ubuntu:
```bash
sudo apt update
sudo apt install git curl build-essential -y

# Instalar Starship
curl -sS https://starship.rs/install.sh | sh

# Instalar Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Instalar Yazi (vía Cargo / Rust)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install --locked yazi-fm yazi-cli
```
