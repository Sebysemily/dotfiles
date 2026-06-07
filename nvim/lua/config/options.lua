-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.sqlite_clib_path = "/usr/lib/x86_64-linux-gnu/libsqlite3.so.0"
-- Forzar a Neovim a leer los parsers de Treesitter
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
