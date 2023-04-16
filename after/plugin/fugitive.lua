vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gl", vim.cmd.GlLog)
vim.keymap.set("n", "<leader>gb", function()
    vim.cmd('Git blame');
end)
vim.keymap.set("n", "<leader>gp", function()
    vim.cmd('Git pull --rebase');
end)
vim.keymap.set("n", "<leader>gP", function()
    vim.cmd('Git push -u origin');
end)
vim.keymap.set("n", "<leader>gc", ':Git checkout ')
vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit)
vim.keymap.set("n", "g/", vim.cmd.Gvdiffsplit)
vim.keymap.set("v", "<leader>=", ":'<,'>diffput<CR>")
vim.keymap.set("v", "<leader>-", ":'<,'>diffget<CR>")
vim.keymap.set("n", "gn", "]c")
vim.keymap.set("n", "gp", "]c")

