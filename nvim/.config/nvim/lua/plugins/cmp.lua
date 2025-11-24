return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- Lädt erst, wenn du anfängst zu tippen
  dependencies = {
    -- Snippet Engine & Expanders
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        -- Build Step für Regex-Support (falls make vorhanden ist)
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    "saadparwaiz1/cmp_luasnip",

    -- Andere Quellen für Autocompletion
    "hrsh7th/cmp-nvim-lsp", -- Verbindung zum LSP
    "hrsh7th/cmp-path",     -- Dateipfade

    -- Fertige Snippets (für React, Python, etc.)
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Lädt VSCode-Style Snippets (aus friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = "menu,menuone,noinsert" },

      -- WICHTIG: Deine Tastenbelegung im Menü
      mapping = cmp.mapping.preset.insert({
        -- Runter / Hoch blättern
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        -- Scrollen in der Doku (dem kleinen Fenster daneben)
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Bestätigen (Enter oder Ctrl+y)
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter drückt "Ja"

        -- Manuell das Menü öffnen (Ctrl+Space)
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Snippet springen (z.B. in einer for-Schleife von i zu value springen)
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),

      -- Woher kommen die Vorschläge?
      sources = {
        { name = "nvim_lsp" }, -- Aus dem LSP (Intelligenz)
        { name = "luasnip" },  -- Snippets
        { name = "path" },     -- Dateipfade
      },
    })
  end,
}
