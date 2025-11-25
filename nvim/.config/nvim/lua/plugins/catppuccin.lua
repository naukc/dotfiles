return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			integrations = {
				-- Core
				cmp = true,
				gitsigns = true,
				treesitter = true,
				which_key = true,

				-- UI & Navigation
				telescope = true,
				oil = true,
				neotree = true,
				bufferline = true,

				-- NEU HINZUGEFÜGT:

				-- Installer & Tools
				mason = true, -- Damit das Mason-Fenster passend aussieht

				-- Command Line & Notifications
				noice = true, -- Wichtig für die cmdline in der Mitte
				notify = true, -- Für die Popups oben rechts

				-- Debugging (Wichtig für deine C-Sessions!)
				dap = true,
				dap_ui = true, -- Damit die Debug-Sidebar korrekt eingefärbt ist

				-- Native LSP Features (Fehler-Unterstreichungen etc.)
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
