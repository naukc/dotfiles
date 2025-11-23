local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Hier sagen wir Lazy: "Lade alles, was im Ordner lua/plugins liegt"
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true }, -- Prüft automatisch auf Updates
})
