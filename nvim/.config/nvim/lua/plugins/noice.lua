return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- WICHTIG: Noice braucht diese Library
		"MunifTanjim/nui.nvim",
		-- OPTIONAL: Für die hübschen Benachrichtigungen oben rechts
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			-- Standard-LSP-Handler überschreiben, damit Noice sie übernimmt
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- Die Presets sorgen für den klassischen "LazyVim"-Look
		presets = {
			bottom_search = true, -- Suche (/) bleibt unten (klassisch), oder false für Mitte
			command_palette = true, -- cmdline (:...) schwebt in der Mitte
			long_message_to_split = true, -- Lange Nachrichten gehen in einen Split
			inc_rename = false, -- (Falls du inc-rename nutzt, auf true setzen)
			lsp_doc_border = true, -- Rand um Hover-Docs
		},
		-- Integration mit notify konfigurieren
		notify = {
			enabled = true,
			view = "notify",
		},
	},
}
