return {
  -- Asegurar que blink.compat esté instalado para leer plugins antiguos como obsidian
  {
    "saghen/blink.compat",
    lazy = true,
    version = "*",
  },
  {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.compat" },
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "fallback" },
        ["<S-Tab>"] = { "fallback" },
      },
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
      sources = {
        -- Quitamos "obsidian_new" para que no te sugiera crear una nota idéntica pero mal formateada
        default = { "obsidian", "obsidian_tags", "lsp", "path", "snippets", "buffer" },
        providers = {
          obsidian = { name = "obsidian", module = "blink.compat.source" },
          obsidian_tags = { name = "obsidian_tags", module = "blink.compat.source" },
        },
      },
    },
  },
}
