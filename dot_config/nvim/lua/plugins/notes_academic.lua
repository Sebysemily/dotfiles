vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto" },
  callback = function()
    -- Soft Wrap para aprovechar la pantalla en notas académicas
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.colorcolumn = "" -- Sin línea molesta
    vim.opt_local.textwidth = 0 -- Sin hard wrap automático
    
    -- Desactivar mini.pairs en Markdown/Quarto para que no choque con los [[]] de Obsidian
    vim.b.minipairs_disable = true
  end,
})

return {
  -- Ecosistema Quarto
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("quarto").setup({
        debug = false,
        closeHover = true,
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
      })
    end,
  },

  -- Integración de BibTeX con Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-bibtex.nvim",
    },
    opts = function(_, opts)
      opts.extensions = opts.extensions or {}
      opts.extensions.bibtex = {
        depth = 1,
        global_files = {
          vim.fn.expand("~/Documents/obsidian_main/2-sources/referencias.bib"),
          vim.fn.expand("~/Documents/obsidian_main/2-sources/peptides.bib"),
        },
        search_keys = { "author", "year", "title" },
        citation_format = "{{author}} ({{year}}), {{title}}.",
        citation_trim_firstname = true,
        citation_max_auth = 2,
        custom_formats = {
          { id = "quarto", match = { "^markdown$", "^quarto$" }, cite_marker = "[@%s]" }
        },
        format = "quarto",
      }
    end,
  },
  {
    "nvim-telescope/telescope-bibtex.nvim",
    config = function()
      require("telescope").load_extension("bibtex")
    end,
  },

  -- Ecosistema Obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = { 
      "BufReadPre *.md", 
      "BufNewFile *.md",
      "BufReadPre *.qmd",
      "BufNewFile *.qmd",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "vault",
          path = "~/Documents/obsidian_main",
        },
      },
      -- Configuración de Plantillas (Templates)
      templates = {
        folder = "5-templates", -- Nombre de la carpeta en tu bóveda donde guardas las plantillas
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- Aquí puedes definir variables personalizadas para tus plantillas
        substitutions = {},
      },
      
      -- Asegurar que el autocompletado nativo esté encendido
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      
      -- Asegurar enlaces limpios sin que Obsidian trate de inventar guiones o rutas largas
      preferred_link_style = "wiki",
      
      -- Desactivar la generación de IDs extraños (con guiones) a partir de los títulos
      note_id_func = function(title)
        -- Si das un título, usa exactamente ese título. Si no, genera un ID simple.
        local id = ""
        if title ~= nil then
          id = title
        else
          id = tostring(os.time())
        end
        return id
      end,
      
      -- Configuración para adjuntos (imágenes pegadas)
      attachments = {
        img_folder = "99-attachments",
        -- Generar enlaces estándar de Markdown para compatibilidad visual con Snacks
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format("![%s](%s)", path.name, path)
        end,
      },
      -- Nombre por defecto de la imagen (fecha y hora para evitar sobreescribir)
      image_name_func = function()
        return string.format("%s-", os.time())
      end,
      
      -- Opcional: Desactiva la creación automática de este bloque si prefieres usar el tuyo propio siempre
      -- disable_frontmatter = true,
    },
  },

  -- Configuración interna de Neovim para silenciar la advertencia de línea larga (MD013) en md y qmd
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--stdin" },
        },
      },
    },
  },
}
