-- local dap = require("dap")
-- dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

-- Add breakpoint at line
vim.keymap.set("n", "<leader>bb", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>bc", "<cmd> DapContinue <CR>")
vim.keymap.set("n", "<leader>bn", "<cmd> DapStepOver <CR>")
vim.keymap.set("n", "<leader>bo", "<cmd> DapStepOut <CR>")
vim.keymap.set("n", "<leader>bi", "<cmd> DapStepInto <CR>")
vim.keymap.set("n", "<leader>bx", "<cmd> DapTerminate <CR>")

-- Open debugging sidebar
vim.keymap.set("n", "<leader>bv", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end)

-- Debug go test
vim.keymap.set("n", "<leader>brg", function()
	require("dap-go").debug_test()
end)

-- Debug go test
vim.keymap.set("n", "<leader>brp", function()
	require("dap-python").test_method()
end)

-- Debug last go test
vim.keymap.set("n", "<leader>brgl", function()
	require("dap-go").debug_last()
end)
