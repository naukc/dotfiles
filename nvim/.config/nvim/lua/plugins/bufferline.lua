return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			-- Style der Trenner: "slant" (schräg), "slope", "thick" oder "thin"
			separator_style = "slant",

			-- Anzeige von Fehlern im Tab (LSP Integration)
			diagnostics = "nvim_lsp",

			-- Offset für Neo-tree (damit die Leiste nicht über dem Explorer liegt)
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},

			-- Indikator für ungespeicherte Änderungen
			-- Standardmäßig ist das ein Kreis, wir machen ihn gut sichtbar
			modified_icon = "●",
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		-- Fix: Wenn man Bufferline nutzt, sollte man die Buffer-Navigation anpassen,
		-- damit sie visuell logisch durch die Tabs springt.
		-- Wir überschreiben hier deine Shift+h / Shift+l Keymaps.
		vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
		vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
	end,
}
