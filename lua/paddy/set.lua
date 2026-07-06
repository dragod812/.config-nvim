vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.pumheight = 12
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.confirm = true
vim.opt.autoread = true
vim.opt.shortmess:append("c")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = "80"
vim.opt.list = true
vim.opt.listchars = {
	tab = "> ",
	trail = ".",
	nbsp = "+",
	extends = ">",
	precedes = "<",
}

vim.env.PATH = vim.env.VIM_PATH or vim.env.PATH
