-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymap für schnelles Verlassen des Insert Mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert Mode with jj" })

-- Sorgt dafür, dass nach der Suche das Ergebnis zentriert wird (wie zz)
vim.keymap.set("n", "n", "nzz", { desc = "Next search match and center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search match and center" })
