require("telescope").load_extension("recent_files")
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

-- independent
vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})

-- Document related keybindings
vim.keymap.set("n", "<leader>do", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>dd", builtin.diagnostics, {})
local method_opts = {
    symbols = {
        "method",
        "function"
    }
}
vim.keymap.set(
    "n",
    "<leader>dm",
    function()
        builtin.lsp_document_symbols(method_opts)
    end
)
vim.keymap.set("n", "<leader>ds", builtin.current_buffer_fuzzy_find, {})

local field_opts = {
    symbols = {
        "field",
        "variable",
        "object",
        "array",
        "constant"
    }
}
vim.keymap.set(
    "n",
    "<leader>dv",
    function()
        builtin.lsp_document_symbols(field_opts)
    end
)

local class_opts = {
    symbols = {
        "interface",
        "class",
        "struct"
    }
}
vim.keymap.set(
    "n",
    "<leader>dc",
    function()
        builtin.lsp_document_symbols(class_opts)
    end
)

-- Project related keybindings
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>po", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set(
    "n",
    "<leader>pj",
    function()
        builtin.jumplist(
            {
                show_line = false
            }
        )
    end,
    {}
)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pl", ":Telescope resume<CR>", {})
vim.keymap.set(
    "n",
    "<leader>ps",
    function()
        builtin.grep_string({search = vim.fn.input("Grep > ")})
    end
)

vim.keymap.set(
    "n",
    "<leader>pm",
    function()
        builtin.lsp_dynamic_workspace_symbols(method_opts)
    end,
    {}
)
vim.keymap.set(
    "n",
    "<leader>pv",
    function()
        builtin.lsp_dynamic_workspace_symbols(field_opts)
    end,
    {}
)
vim.keymap.set(
    "n",
    "<leader>pc",
    function()
        builtin.lsp_dynamic_workspace_symbols(class_opts)
    end,
    {}
)

-- Extensions
vim.keymap.set("n", "<leader>pr", extensions.recent_files.pick, {})
vim.keymap.set("n", "<leader><CR>", builtin.find_files, {})
