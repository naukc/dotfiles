return {
	"lervag/vimtex",
	lazy = false, -- Wichtig: VimTeX sollte nicht zu lazy geladen werden
	init = function()
		-- PDF Viewer Einstellung (Skim für Mac)
		vim.g.vimtex_view_method = "skim"

		-- Optional: PDF Viewer Fenster nicht fokussieren nach dem Kompilieren
		-- (damit du im Editor bleiben und weiter tippen kannst)
		vim.g.vimtex_view_skim_sync = 1
		vim.g.vimtex_view_skim_activate = 1

		-- Map Leader Key für VimTeX (Standard ist der lokale Leader, wir nutzen Space)
		vim.g.maplocalleader = " "
	end,
}
