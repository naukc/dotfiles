-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Setzt den Standard-Indent auf 3 Leerzeichen

-- 1. Breite eines Tab-Zeichens (sollte 3 sein)
vim.opt.tabstop = 3

-- 2. Breite für Auto-Einrückung (Wichtig für das Einrücken mit >> und Tab)
vim.opt.shiftwidth = 3

-- 3. Stellt sicher, dass Tabs in Leerzeichen umgewandelt werden (Soft Indent)
vim.opt.expandtab = true

-- Stellt sicher, dass 8 Zeilen Kontext (oben/unten) sichtbar bleiben
-- Dies betrifft alle Bewegungen, auch Strg+U/D.
vim.opt.scrolloff = 8
