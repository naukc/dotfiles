-- Leader Key auf Space setzen (WICHTIG!)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Deine Keymaps
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "n", "nzz", { desc = "Next search match centered" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search match centered" })

-- Schnell speichern
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
