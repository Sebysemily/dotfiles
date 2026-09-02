-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- En tu init.lua
vim.keymap.set("i", "jj", "<Esc>", { desc = "Salir de insert mode con jj" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Salir de insert mode con jk" })
vim.keymap.set("n", "qw", "<cmd>w | bd<CR>", { desc = "Save and close buffer" })
vim.keymap.set("n", "qq", "<cmd>bd!<CR>", { desc = "Close buffer without saving" })
-- Enviar 'd' (delete) al agujero negro en modo normal y visual
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })


-- Grupo de Escritura Académica (Super + O mayúscula)
local map = vim.keymap.set
map("n", "<leader>Op", "<cmd>QuartoPreview<cr>", { desc = "Quarto Preview (Zathura)" })
map("n", "<leader>Oc", "<cmd>Telescope zotero<cr>", { desc = "Insertar Cita Zotero" })
map("n", "<leader>Os", "<cmd>ObsidianSearch<cr>", { desc = "Buscar en Obsidian" })
map("n", "<leader>Ol", "<cmd>ObsidianFollowLink<cr>", { desc = "Seguir enlace" })
map("n", "<leader>Ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Ver Backlinks" })
map("n", "<leader>Ot", "<cmd>ObsidianTemplate<cr>", { desc = "Insertar Plantilla" })

-- Which-key group for Academic / Obsidian
local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.add({
    { "<leader>O", group = "Academic / Obsidian" },
  })
end
