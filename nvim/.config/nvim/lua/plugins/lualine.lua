return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },

				-- HIER IST DER FIX:
				-- Wir deaktivieren die Leiste explizit für bestimmte Dateitypen.
				-- Das verhindert Fehler und blendet sie sauber aus.
				disabled_filetypes = {
					statusline = {
						"alpha", -- Das Dashboard
						"lazy", -- Der Plugin Manager
						"mason", -- Der Tool Installer
						"TelescopePrompt", -- Während der Suche (optional)
					},
					winbar = {
						"alpha",
						"lazy",
						"mason",
					},
				},
			},

			-- Extensions lassen wir sicherheitshalber leer oder nutzen nur standardmäßige,
			-- um weitere Fehler zu vermeiden.
			extensions = { "lazy" },
		})
	end,
}
