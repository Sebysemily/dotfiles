-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Iniciar btop (Monitor de sistema)
o.bind("CTRL + SHIFT + ESCAPE", "Task Manager (btop)", "kitty -e btop")

-- ==========================================
-- VIM MOTIONS: Reemplazo de flechas por hjkl
-- ==========================================

-- 1. Desvincular las teclas antiguas y las funciones por defecto
hl.unbind("SUPER + LEFT")
hl.unbind("SUPER + RIGHT")
hl.unbind("SUPER + UP")
hl.unbind("SUPER + DOWN")

hl.unbind("SUPER + J") -- Antes: Toggle window split
hl.unbind("SUPER + K") -- Antes: Menu de Keybindings
hl.unbind("SUPER + L") -- Antes: Toggle workspace layout

-- 2. Movimiento de Ventanas con Vim Motions (h, j, k, l)
o.bind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Focus down", hl.dsp.focus({ direction = "d" }))

-- 3. Mover la ventana físicamente (Swap) con SHIFT + Vim Motions
hl.unbind("SUPER + SHIFT + LEFT")
hl.unbind("SUPER + SHIFT + RIGHT")
hl.unbind("SUPER + SHIFT + UP")
hl.unbind("SUPER + SHIFT + DOWN")

o.bind("SUPER + SHIFT + H", "Swap window left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + L", "Swap window right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

-- 4. Reasignar las funciones antiguas (J, K, L) a las flechas directas
o.bind("SUPER + DOWN", "Toggle window split", hl.dsp.layout("togglesplit"))
o.bind("SUPER + UP", "Keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + RIGHT", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")
