local builtin = require('telescope.builtin')

-- Document related keybindings
vim.keymap.set('n', '<leader>do', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>dd', builtin.diagnostics, {})
local method_opts = {
    symbols = {
        "method",
        "function",
    }
}
vim.keymap.set('n', '<leader>dm', function()
    builtin.lsp_document_symbols(method_opts)
end)

local field_opts = {
    symbols = {
        "field",
        "variable",
        "object",
        "array",
        "constant",
    }
}
vim.keymap.set('n', '<leader>dv', function()
    builtin.lsp_document_symbols(field_opts)
end)

local class_opts = {
    symbols = {
        "interface",
        "class",
        "struct",
    }
}
vim.keymap.set('n', '<leader>dc', function()
    builtin.lsp_document_symbols(class_opts)
end)

-- Project related keybindings
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>po', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>pm', function()
    builtin.lsp_dynamic_workspace_symbols(method_opts)
end, {})
vim.keymap.set('n', '<leader>pv', function()
    builtin.lsp_dynamic_workspace_symbols(field_opts)
end, {})
vim.keymap.set('n', '<leader>pc', function()
    builtin.lsp_dynamic_workspace_symbols(class_opts)
end, {})

