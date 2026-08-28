return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        keymap = {
          accept = "<C-J>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        ["*"] = true,
        python = true,
        ipynb = true,
        quarto = true,
        markdown = true,
        ["python.jupyter"] = true,
        yaml = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    },
  },
}
