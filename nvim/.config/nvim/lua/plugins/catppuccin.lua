return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- WICHTIG: Das Theme muss als Erstes laden
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Optionen: "latte" (hell), "frappe", "macchiato", "mocha" (dunkel)
      transparent_background = false, -- Setze auf true, falls du den Terminal-Hintergrund willst
      integrations = {
        cmp = true,       -- (Kommt später für Autocomplete)
        gitsigns = true,  -- (Kommt später für Git)
        telescope = true, -- Haben wir schon
        which_key = true, -- Haben wir schon
        oil = true,       -- Haben wir schon
        treesitter = true,-- (Kommt später für Syntax Highlighting)
      },
    })

    -- Befehl zum Aktivieren des Themes
    vim.cmd.colorscheme "catppuccin"
  end,
}
