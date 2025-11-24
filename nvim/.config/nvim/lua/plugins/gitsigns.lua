return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Lädt sofort beim Dateiöffnen
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			-- Keymaps für Gitsigns (optional, aber nützlich)
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation durch Änderungen (J/K im Git-Kontext)
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Next Git Hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Prev Git Hunk" })

				-- Actions
				map("n", "<leader>gp", gs.preview_hunk, { desc = "Git Preview Hunk" }) -- Zeigt Vorschau der Änderung
				map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle Git Blame" }) -- Zeigt wer die Zeile geschrieben hat
			end,
		})
	end,
}
