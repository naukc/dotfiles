return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- Hier definieren wir den Keybind für Lazy
	keys = {
		{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
	},
	config = function()
		require("toggleterm").setup({
			size = 20,
			-- Wir entfernen 'open_mapping', da wir es oben manuell definiert haben
			direction = "float", -- 'float', 'horizontal', oder 'vertical'
			float_opts = {
				border = "curved",
			},
		})

		-- Damit man im Terminal einfach mit Esc in den Normal-Mode kommt
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			-- WICHTIG: Esc bringt dich aus dem Insert-Mode des Terminals raus
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

			-- Navigation zwischen Fenstern, auch wenn man im Terminal ist
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
