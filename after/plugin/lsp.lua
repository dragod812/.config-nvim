local lsp = require("lsp-zero").preset("recommended")


lsp.ensure_installed({
    'gopls',
    'pylsp@1.3.3',
    'lua_ls',
    'yamlls',
    'bashls',
    'jdtls',
    'clangd',
    'sqlls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "go", function() vim.lsp.buf.document_symbol() end, opts)
    vim.keymap.set("n", "gl", "<C-w>l", opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>i", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>I", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vi", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setloclist() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set({"i"}, "<C-a>", function() vim.lsp.buf.code_action() end, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vl", function() vim.cmd.LspRestart() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


require('lspconfig').gopls.setup({
    cmd = { 'gopls', '-remote=auto' },
    flags = {
        debounce_text_changes = 1000,
    },
    settings = {
        gopls = {
            directoryFilters = {
                "-bazel-bin",
                "-babzel-out",
                "-bazel-testlogs",
                "-bazel-mypkg"
            },
        },
    },
})

require 'lspconfig'.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pyflakes = { enabled = false },
                pycodestyle = {
                    ignore = { 'W391' },
                },
                pylint = {
                    enabled = true,
                    ignore = { 'E0401' }
                },
                flake8 = {
                    enabled = true,
                    ignore = { 'E501', 'E999', 'R0903' , 'E0401' }
                },
                black = { enabled = true }
            }
        }
    }
}

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local dart_lsp = lsp.build_options('dartls', {})

require('flutter-tools').setup({
    lsp = {
        capabilities = dart_lsp.capabilities
    }
})
