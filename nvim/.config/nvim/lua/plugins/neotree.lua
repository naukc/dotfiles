return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Icons
		"MunifTanjim/nui.nvim",
	},
	-- Der Keybind: Space + e (Explorer)
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
	},
	config = function()
		require("neo-tree").setup({
			-- Soll Neo-tree das Fenster schließen, wenn eine Datei geöffnet wird?
			-- false = es bleibt als Sidebar offen (wie in VS Code)
			close_if_last_window = true,

			-- Optik
			default_component_configs = {
				indent = {
					with_expanders = true, -- Fügt kleine Pfeile vor Ordnern hinzu
					expander_collapsed = "",
					expander_expanded = "",
				},
			},

			filesystem = {
				-- Wenn du eine Datei öffnest, soll Neo-tree automatisch zu dieser Datei scrollen?
				follow_current_file = {
					enabled = true,
				},
				-- Versteckte Dateien (mit Punkt) anzeigen?
				filtered_items = {
					visible = false, -- Setze auf true, wenn du .gitignore Dateien immer sehen willst
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				-- Netrw nicht kapern (damit Oil weiterhin für "Ordner öffnen" funktioniert)
				hijack_netrw_behavior = "disabled",
			},
		})
	end,
}
