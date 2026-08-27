return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "fallback" },
        ["<S-Tab>"] = { "fallback" },
      },
      completion = {
        list = {
          selection = {
            -- Esto evita que el texto se inserte automáticamente en el código
            -- mientras navegas por la lista con las flechas.
            preselect = true,
            auto_insert = false,
          },
        },
      },
    },
  },
}
