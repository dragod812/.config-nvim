vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gc", vim.cmd.GlLog)
vim.keymap.set("n", "g/", vim.cmd.Gvdiffsplit)
vim.keymap.set("v", "<leader>=", ":'<,'>diffput<CR>")
vim.keymap.set("v", "<leader>-", ":'<,'>diffget<CR>")

