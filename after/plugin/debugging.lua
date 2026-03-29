-- DAP keymaps under <leader>t to match test/debug grouping
vim.keymap.set("n", "<leader>tb", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>tc", "<cmd>DapContinue<CR>")
vim.keymap.set("n", "<leader>tsn", "<cmd>DapStepOver<CR>")
vim.keymap.set("n", "<leader>tso", "<cmd>DapStepOut<CR>")
vim.keymap.set("n", "<leader>tsi", "<cmd>DapStepInto<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>DapTerminate<CR>")

-- Open debugging sidebar
vim.keymap.set("n", "<leader>tv", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end)

-- Debug go test
vim.keymap.set("n", "<leader>tdg", function()
	require("dap-go").debug_test()
end)

-- Debug python test
vim.keymap.set("n", "<leader>tdp", function()
	require("dap-python").test_method()
end)

-- Debug last go test
vim.keymap.set("n", "<leader>tdl", function()
	require("dap-go").debug_last()
end)
