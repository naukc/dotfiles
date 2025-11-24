return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Wichtig: Führt Updates nach der Installation aus
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Deine gewünschte Liste (+ vim/vimdoc für die Config selbst)
      ensure_installed = { 
        "c", 
        "cpp", 
        "javascript", 
        "python", 
        "lua", 
        "markdown", 
        "markdown_inline", -- Wichtig für Code-Blöcke in Markdown
        "vim",             -- Für Vimscript
        "vimdoc",          -- Für die Hilfeseiten
        "query"            -- Für Treesitter-Queries
      },

      -- Fehlende Parser automatisch installieren, wenn du eine Datei öffnest
      auto_install = true,

      -- Das eigentliche Highlight-Modul aktivieren
      highlight = {
        enable = true,
        -- Standard-Vim-Highlighting für diese Dinge deaktivieren (Treesitter ist besser)
        additional_vim_regex_highlighting = false,
      },

      -- Intelligentes Einrücken basierend auf Code-Struktur (experimentell, aber meistens gut)
      indent = { enable = true },
    })
  end,
}
