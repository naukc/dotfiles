return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- Zeit in ms, bis das Menü erscheint (LazyVim Standard)
  end,
  opts = {
    -- Hier definieren wir die "Überschriften" für deine Gruppen
    spec = {
      mode = { "n", "v" }, -- Gilt für Normal und Visual Mode
      { "<leader>s", group = "Search" }, -- Benennt die Gruppe s als "Search"
      { "<leader>f", group = "File" },   -- (Beispiel für später)
      { "<leader>v", group = "Visuell/Split" }, -- Unsere Split Keymaps
      { "<leader>b", group = "Buffer" }, -- Unsere Buffer Keymaps
    },
    -- Optik anpassen (Icons etc.)
    icons = {
      breadcrumb = "»", -- Symbol in der Leiste oben
      separator = "➜", -- Symbol zwischen Taste und Beschreibung
      group = "+", -- Symbol für Gruppen
    },
  },
}
