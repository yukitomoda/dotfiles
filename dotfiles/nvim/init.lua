vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.guifont = "Hack Nerd Font"
vim.o.list = true
vim.o.listchars = "tab:>-,eol:<,nbsp:%,trail:-"
vim.o.wrap = false
vim.o.shell = "nu"
vim.o.shellcmdflag = "-c"
vim.o.shellquote = ""
vim.o.shellxquote = ""

vim.api.nvim_set_keymap('n', '\\', '<Leader>', {})
vim.api.nvim_set_keymap('n', '<Leader>', 'o', { noremap = true })

-- lazy.vim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
