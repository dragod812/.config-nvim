vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gf", function()
    vim.cmd('Git log -100 --oneline -- %');
end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gl", function()
    vim.cmd('Git log -100 --oneline .');
end)
vim.keymap.set("n", "<leader>gb", function()
    vim.cmd('Git blame');
end)
vim.keymap.set("n", "<leader>gp", function()
    vim.cmd('Git pull --rebase');
end)
vim.keymap.set("n", "<leader>gP", function()
    vim.cmd('Git push -u origin');
end)
vim.keymap.set("n", "<leader>g=", function()
    vim.cmd('Git add .');
end)
vim.keymap.set("n", "<leader>g-", function()
    vim.cmd('Git reset --mixed HEAD');
end)
vim.keymap.set("n", "<leader>gc", ':Git checkout ')
-- dont use
vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit)
vim.keymap.set("n", "<leader>gD", function()
    vim.cmd.diffoff()
    vim.cmd.edit()
end)
vim.keymap.set("n", "g/", vim.cmd.Gvdiffsplit)
vim.keymap.set("v", "<leader>g=", ":'<,'>diffput<CR>")
vim.keymap.set("v", "<leader>g-", ":'<,'>diffget<CR>")
vim.keymap.set("n", "gn", "]c")
vim.keymap.set("n", "gp", "]c")

vim.keymap.set("n", "<leader>h", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>diffget //3<CR>")
