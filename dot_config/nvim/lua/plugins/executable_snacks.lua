return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        db = {
          sqlite3_path = "/usr/lib/x86_64-linux-gnu/libsqlite3.so.0",
        },
      },
      image = {
        enabled = true,
        -- Ayudar a Snacks a encontrar imágenes en la bóveda de Obsidian
        resolve = function(file, src)
          -- Si la ruta ya es absoluta o web, déjala
          if src:match("^/") or src:match("^http") then
            return src
          end
          -- Resolver rutas relativas asumiendo la bóveda actual de Obsidian
          local vault_path = vim.fn.expand("~/Documents/obsidian_main/")
          -- Si el archivo referenciado existe en la bóveda, retornar esa ruta
          local full_path = vault_path .. src
          if vim.fn.filereadable(full_path) == 1 then
            return full_path
          end
          return nil
        end,
      },
    },
  },
}
