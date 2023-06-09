-- vim.keymap.set('n', '<leader>td', function()
--     require('neotest').run.run({ strategy = 'dap' })
-- end, {})
vim.keymap.set('n', '<leader>tr', require('neotest').run.run, {})
vim.keymap.set('n', '<leader>tf', function()
    require('neotest').run.run(vim.fn.expand('%'))
end, {})
vim.keymap.set('n', '<leader>to', function()
    require("neotest").output.open({ enter = true })
end, {})
vim.keymap.set('n', '<leader>tO', function()
    require("neotest").output_panel.toggle()
end, {})
-- vim.keymap.set('n', '<leader>ta', function()
--     require('neotest').run.attach()
-- end, {})
