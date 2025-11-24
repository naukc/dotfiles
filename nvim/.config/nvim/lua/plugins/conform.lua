return {
  {
    -- 1. Automatischer Installer für die Formatter-Tools
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",       -- Formatter für Lua
          "prettier",     -- Formatter für JS, TS, Markdown, HTML, CSS
          "black",        -- Formatter für Python
          "isort",        -- Sortiert Python Imports
          "clang-format", -- Formatter für C / C++
        },
      })
    end,
  },

  {
    -- 2. Das Formatting Plugin selbst (Conform)
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Lädt, bevor gespeichert wird
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Manuelles Formatieren mit Leader + f
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      -- Hier konfigurieren wir das "Format on Save"
      format_on_save = function(bufnr)
        -- Zeige Warnung, wenn kein Formatter da ist (optional)
        return {
          timeout_ms = 500, -- Wie lange darf es dauern?
          lsp_fallback = true, -- Wenn kein Formatter da ist, nutze den LSP (z.B. clangd)
        }
      end,
      -- Hier verknüpfen wir Sprache -> Tool
      formatters_by_ft = {
        lua = { "stylua" },
        -- Bei Python erst Imports sortieren, dann formatieren
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        -- Bei C/C++ nutzen wir clang-format (oder Fallback auf LSP)
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
