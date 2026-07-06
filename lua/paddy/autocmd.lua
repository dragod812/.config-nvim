local augroup = vim.api.nvim_create_augroup("paddy", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup,
	desc = "Reload files changed outside Neovim",
	callback = function()
		if vim.o.buftype == "" then
			vim.cmd.checktime()
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "help", "man", "qf", "query", "startuptime" },
	desc = "Close utility windows with q",
	callback = function(event)
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
