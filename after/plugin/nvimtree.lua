vim.keymap.set("n", "<leader>x", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "gx", function()
    require("nvim-tree.api").tree.find_file();
    vim.cmd.NvimTreeFocus();
end)
