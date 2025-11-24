-- lua/config/keymaps.lua

-- Leader Key auf Space setzen (falls nicht schon in init.lua, aber hier schadet es nicht)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert Mode verlassen mit jj
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert Mode" })

-- Suche zentrieren
vim.keymap.set("n", "n", "nzz", { desc = "Next search match centered" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search match centered" })

-- Schnell speichern
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Bessere Window Navigation (Strg + hjkl)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splits erstellen (Space + v / Space + h)
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>h", "<cmd>split<cr>", { desc = "Horizontal Split" })
-- Fenster schließen
vim.keymap.set("n", "<leader>x", "<cmd>close<cr>", { desc = "Close current window" })

-- Buffer Navigation (Shift + h/l)
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Buffer schließen (Space + bd)
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
