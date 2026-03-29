require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "c", "lua", "go", "java", "python", "dart", "json", "bash" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 20
