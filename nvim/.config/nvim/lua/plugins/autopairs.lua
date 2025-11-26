return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true, -- Nutzt Treesitter, um z.B. nicht in Kommentaren Paare zu erstellen
		ts_config = {
			lua = { "string" }, -- Keine Paare in Lua-Strings
			javascript = { "template_string" }, -- Keine Paare in JS Template Strings
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
	},
}
