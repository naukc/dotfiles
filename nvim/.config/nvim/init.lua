-- 1. Globals setzen (Leader Key muss VOR Lazy geladen werden)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. Options und Keymaps laden
require("config.options")
require("config.keymaps")

-- 3. Plugin Manager starten
require("config.lazy")
