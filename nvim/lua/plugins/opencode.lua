return {
  {
    "sudo-tee/opencode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim", -- Muchas interfaces de chat usan nui
    },
    opts = {
      -- Aquí puedes colocar la configuración específica de opencode.
      -- Por defecto se enlazará con el binario de opencode en tu PATH.
    },
    keys = {
      { "<leader>oc", "<cmd>OpenCodeChat<cr>", desc = "OpenCode Chat" },
      { "<leader>oe", "<cmd>OpenCodeExplain<cr>", desc = "OpenCode Explain" },
    },
  },
}
