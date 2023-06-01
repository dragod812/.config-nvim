local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-m>", function() ui.nav_file(4) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-J>", function() ui.nav_file(5) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-K>", function() ui.nav_file(6) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-L>", function() ui.nav_file(7) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-M>", function() ui.nav_file(8) end, { noremap = true, silent = true })


