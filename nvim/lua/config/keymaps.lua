-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- En tu init.lua
vim.keymap.set("i", "jj", "<Esc>", { desc = "Salir de insert mode con jj" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Salir de insert mode con jk" })
vim.keymap.set("n", "qw", "<cmd>wq<CR>", { desc = "Save and quit" })
vim.keymap.set("n", "qq", "<cmd>q!<CR>", { desc = "Quit without saving" })
