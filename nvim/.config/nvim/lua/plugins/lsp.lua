return {
	-- 1. Die Haupt-LSP-Konfiguration
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Installer für die LSP-Server
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Besseres Lua-Entwicklungs-Erlebnis
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		-- Mason Setup (der Installer)
		require("mason").setup()

		-- Capabilities definieren (für späteres Autocomplete)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Mason-LSPConfig Setup (Hier ist der Fix!)
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"ts_ls",
			},
			-- HIER IST DIE ÄNDERUNG: 'handlers' ist jetzt ein Feld innerhalb von setup
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})

		-- Keymaps erstellen, wenn ein LSP geladen wird
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation") -- Neu (einfügen):
				map("<leader>cs", function()
					-- Wir fragen den LSP direkt nach der passenden Header/Source Datei
					vim.lsp.buf_request(0, "textDocument/switchSourceHeader", nil, function(err, uri)
						if err or not uri or uri == "" then
							print("Keine passende Header/Source Datei gefunden (oder LSP noch nicht bereit).")
							return
						end
						-- Datei öffnen
						vim.cmd.edit(vim.uri_to_fname(uri))
					end)
				end, "[C]langd [S]witch Header/Source")
			end,
		})
	end,
}
