return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		-- 1. Header
		dashboard.section.header.val = {
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		}

		-- 2. Buttons
		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "🔍 Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "🕒 Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "🔎 Find text", ":Telescope live_grep<CR>"),
			dashboard.button("c", "⚙️  Config", ":e $MYVIMRC <CR>"),
			dashboard.button("l", "💤 Lazy", ":Lazy<CR>"),
			dashboard.button("q", "❌ Quit", ":qa<CR>"),
		}

		-- 3. Footer (KORRIGIERT)
		local function footer()
			-- Wir holen die Stats frisch, wenn das Dashboard gezeichnet wird
			local stats = require("lazy").stats()
			-- Wir runden auf 2 Nachkommastellen
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
		end

		-- WICHTIG: Hier übergeben wir nur den Namen der Funktion 'footer'
		-- NICHT 'footer()'. Alpha ruft sie dann später selbst auf.
		dashboard.section.footer.val = footer

		-- 4. Styling
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Type"

		require("alpha").setup(dashboard.config)

		-- Auto-Refresh Logic (die hast du ja schon, die lassen wir so)
		vim.api.nvim_create_autocmd("BufDelete", {
			callback = function(event)
				local is_listed = vim.fn.getbufinfo(event.buf)[1].listed == 1
				if not is_listed or not vim.v.vim_did_enter then
					return
				end
				vim.schedule(function()
					local listed_bufs = vim.fn.getbufinfo({ buflisted = 1 })
					if #listed_bufs == 0 or (#listed_bufs == 1 and listed_bufs[1].name == "") then
						if vim.bo.filetype ~= "alpha" then
							vim.cmd("Alpha")
						end
					end
				end)
			end,
		})
	end,
}
