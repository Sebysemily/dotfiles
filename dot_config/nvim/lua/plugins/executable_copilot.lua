return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          -- LazyVim desactiva esto por defecto, aquí lo forzamos a <C-J>
          accept = "<C-J>",
        },
      },
      filetypes = {
        ["*"] = true,
        python = true,
        ipynb = true,
        quarto = true,
        markdown = true,
        ["python.jupyter"] = true,
        yaml = false,
        help = false,
      },
    },
  },
}
