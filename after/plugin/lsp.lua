-- Mason: auto-install LSP servers
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"pyright",
		"lua_ls",
		"yamlls",
		"bashls",
		"jdtls",
		"clangd",
		"sqlls",
	},
	automatic_enable = {
		exclude = { "stylua" },
	},
})

-- nvim-cmp completion setup
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

-- Share cmp capabilities with all LSP servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- Server-specific configs
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("gopls", {
	cmd = { "gopls", "-remote=auto" },
	settings = {
		gopls = {
			directoryFilters = {
				"-bazel-bin",
				"-babzel-out",
				"-bazel-testlogs",
				"-bazel-mypkg",
			},
		},
	},
})

vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				autoSearchPaths = false,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
	filetypes = { "python" },
})

-- Enable all servers
vim.lsp.enable({ "gopls", "pyright", "lua_ls", "yamlls", "bashls", "jdtls", "clangd", "sqlls" })

-- Diagnostic config
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.HINT] = "H",
			[vim.diagnostic.severity.INFO] = "I",
		},
	},
})

-- LSP keymaps on attach
-- Nvim 0.11 provides: gd, gD (declaration), K, grr, gra, grn, gri, grt, ]d, [d
-- We only add keymaps that Nvim 0.11 doesn't provide by default
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf, remap = false }
		vim.keymap.set("n", "go", vim.lsp.buf.document_symbol, opts)
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
		vim.keymap.set("n", "<leader>i", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
		vim.keymap.set("n", "<leader>I", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)
		vim.keymap.set("n", "<leader>vi", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.setloclist, opts)
		vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>vl", vim.cmd.LspRestart, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	end,
})

-- Flutter/Dart
require("flutter-tools").setup({
	debugger = {
		enabled = true,
		run_via_dap = true,
	},
	lsp = {
		capabilities = capabilities,
	},
})
