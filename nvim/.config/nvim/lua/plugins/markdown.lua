-- ~/.config/nvim/lua/plugins/markdown.lua
return {

  -- 1. Obsidian Integration
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      -- Löst aus, wenn eine .md-Datei im Vault gelesen wird
      "BufReadPre "
        .. vim.fn.expand("$HOME")
        .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault/*.md",
      -- Löst aus, wenn eine neue Datei im Vault-Ordner erstellt wird
      "BufNewFile "
        .. vim.fn.expand("$HOME")
        .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault/",
    },
    dependencies = {
      -- Benötigte Abhängigkeiten (sollten schon da sein, aber sicher ist sicher)
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      -- Haupt-Vault-Verzeichnis
      dir = vim.fn.expand("$HOME") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault",

      -- Optionale Konfiguration (Standardwerte)
      daily_notes = {
        folder = "Daily Notes",
        date_format = "%Y-%m-%d",
      },
      completion = {
        nvim_cmp = true,
      },
    },
  }, -- <-- WICHTIGES KOMMA ZWISCHEN DEN PLUGINS

  -- 2. Markdown Rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false, -- Sofort laden, damit der Keymap funktioniert
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({
        -- Stelle sicher, dass 'brew install glow' ausgeführt wurde
        renderer = "glow",
      })

      -- Keymap zum Togglen der Vorschau (Leader + r)
      vim.keymap.set("n", "<localleaderr", require("render-markdown").toggle, { desc = "Toggle Markdown Render" })
    end,
  },
}
