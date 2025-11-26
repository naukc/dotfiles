-- Zeilennummern anzeigen
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs und Einrückung (2 Spaces)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Suche
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clipboard mit System teilen
vim.opt.clipboard = "unnamedplus"

-- Zeilenumbruch aktivieren
vim.opt.wrap = true

-- Wörter nicht mitten drin trennen (nur an Leerzeichen etc.)
vim.opt.linebreak = true

-- Einrückung bei Umbruch beibehalten (WICHTIG für Code)
vim.opt.breakindent = true

-- Optional: Kleines Symbol anzeigen, wenn eine Zeile umgebrochen ist
vim.opt.showbreak = "↪ "
