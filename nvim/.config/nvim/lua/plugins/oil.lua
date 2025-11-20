return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Für Icons im Dateibrowser
  },
  config = function()
    require("oil").setup({
      -- Hier können später weitere Optionen stehen
      keymaps = {
        -- Nutze die Standard-Oil-Keymaps
        ["<C-h>"] = "actions.select_split",
        ["<C-j>"] = "actions.select_vsplit",
        ["<C-k>"] = "actions.select_tab",
        ["<C-l>"] = "actions.preview",
      },
      view_options = {
        show_hidden = true,
      },
    })

    -- Setze die Taste zum Wechseln ins übergeordnete Verzeichnis
    -- 'oil' öffnet den Dateibrowser, und die Standardtaste dafür ist der Bindestrich
    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil: Go to parent directory / Open" })
  end,
}
