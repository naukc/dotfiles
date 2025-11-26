return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"cpp",
				"javascript",
				"python",
				"lua",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
				"query",
				"bash", -- nützlich
			},

			-- HIER IST DER FIX:
			-- Auf 'false' setzen, um den CLI-Fehler zu vermeiden.
			-- Die Parser oben in der Liste werden trotzdem installiert.
			auto_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
