local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- Colorscheme (loads first)
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = { flavour = "mocha" },
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"smartpde/telescope-recent-files",
		},
		config = function()
			require("telescope").load_extension("recent_files")
			local builtin = require("telescope.builtin")
			local extensions = require("telescope").extensions

			vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})

			-- Document related
			vim.keymap.set("n", "<leader>do", builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>dd", builtin.diagnostics, {})
			local method_opts = { symbols = { "method", "function" } }
			vim.keymap.set("n", "<leader>dm", function()
				builtin.lsp_document_symbols(method_opts)
			end)
			vim.keymap.set("n", "<leader>ds", builtin.current_buffer_fuzzy_find, {})
			local field_opts = { symbols = { "field", "variable", "object", "array", "constant" } }
			vim.keymap.set("n", "<leader>dv", function()
				builtin.lsp_document_symbols(field_opts)
			end)
			local class_opts = { symbols = { "interface", "class", "struct" } }
			vim.keymap.set("n", "<leader>dc", function()
				builtin.lsp_document_symbols(class_opts)
			end)

			-- Project related
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>po", builtin.lsp_dynamic_workspace_symbols, {})
			vim.keymap.set("n", "<leader>pj", function()
				builtin.jumplist({ show_line = false })
			end, {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>pl", "<cmd>Telescope resume<CR>", {})
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<leader>pm", function()
				builtin.lsp_dynamic_workspace_symbols(method_opts)
			end, {})
			vim.keymap.set("n", "<leader>pv", function()
				builtin.lsp_dynamic_workspace_symbols(field_opts)
			end, {})
			vim.keymap.set("n", "<leader>pc", function()
				builtin.lsp_dynamic_workspace_symbols(class_opts)
			end, {})

			-- Extensions
			vim.keymap.set("n", "<leader>pr", extensions.recent_files.pick, {})
			vim.keymap.set("n", "<leader><CR>", builtin.find_files, {})
		end,
	},

	-- Treesitter (main branch — new API for Nvim 0.12)
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local ensure_installed = {
				"javascript",
				"typescript",
				"c",
				"lua",
				"go",
				"java",
				"python",
				"dart",
				"json",
				"bash",
			}
			require("nvim-treesitter").install(ensure_installed)

			local filetypes = {}
			for _, lang in ipairs(ensure_installed) do
				local ft = vim.treesitter.language.get_filetypes(lang)
				vim.list_extend(filetypes, ft)
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.opt.foldlevel = 20
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },

	-- Harpoon
	{
		"theprimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
			vim.keymap.set("n", "<C-j>", function()
				ui.nav_file(1)
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-k>", function()
				ui.nav_file(2)
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-l>", function()
				ui.nav_file(3)
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-n>", function()
				ui.nav_file(4)
			end, { noremap = true, silent = true })
		end,
	},

	-- Undotree
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>u",
				function()
					vim.cmd.UndotreeToggle()
					vim.cmd.UndotreeFocus()
				end,
				desc = "Undo Tree",
			},
		},
	},

	-- Git (fugitive)
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
			vim.keymap.set("n", "<leader>gf", function()
				vim.cmd("Git log -100 --oneline -- %")
			end, { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>gl", function()
				vim.cmd("Git log -100 --oneline .")
			end)
			vim.keymap.set("n", "<leader>gb", function()
				vim.cmd("Git blame")
			end)
			vim.keymap.set("n", "<leader>gM", function()
				vim.cmd("Git diff main")
			end)
			vim.keymap.set("n", "<leader>gp", function()
				vim.cmd("Git pull --rebase")
			end)
			vim.keymap.set("n", "<leader>gP", function()
				vim.cmd("Git push -u origin")
			end)
			vim.keymap.set("n", "<leader>g=", function()
				vim.cmd("Git add .")
			end)
			vim.keymap.set("n", "<leader>g-", function()
				vim.cmd("Git reset --mixed HEAD")
			end)
			vim.keymap.set("n", "<leader>gr", ":Git rebase ")
			vim.keymap.set("n", "<leader>gc", ":Git checkout ")
			vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit)
			vim.keymap.set("n", "<leader>gD", function()
				vim.cmd.diffoff()
				vim.cmd.edit()
			end)
			vim.keymap.set("n", "g/", vim.cmd.Gvdiffsplit)
			vim.keymap.set("v", "<leader>g=", ":'<,'>diffput<CR>")
			vim.keymap.set("v", "<leader>g-", ":'<,'>diffget<CR>")
			vim.keymap.set("n", "]h", "]c", { desc = "Next diff hunk" })
			vim.keymap.set("n", "[h", "[c", { desc = "Prev diff hunk" })
			vim.keymap.set("n", "<leader>h", "<cmd>diffget //2<CR>")
			vim.keymap.set("n", "<leader>l", "<cmd>diffget //3<CR>")
			vim.keymap.set("n", "<leader>gz0", "<cmd>Git stash apply stash@{0}<CR>")
			vim.keymap.set("n", "<leader>gz1", "<cmd>Git stash apply stash@{1}<CR>")
			vim.keymap.set("n", "<leader>gz2", "<cmd>Git stash apply stash@{2}<CR>")
		end,
	},

	-- Copilot
	{ "github/copilot.vim" },

	-- Flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				function()
					require("flash").jump({ remote_op = { restore = true, motion = nil } })
				end,
				mode = { "n", "x", "o" },
				desc = "Flash",
			},
			{
				"S",
				function()
					require("flash").treesitter()
				end,
				mode = { "n", "o", "x" },
				desc = "Flash Treesitter",
			},
			{
				"r",
				function()
					require("flash").remote()
				end,
				mode = "o",
				desc = "Remote Flash",
			},
			{
				"R",
				function()
					require("flash").treesitter_search()
				end,
				mode = { "o", "x" },
				desc = "Treesitter Search",
			},
		},
	},

	-- Bazel support
	{ "google/vim-maktaba" },
	{ "bazelbuild/vim-bazel", dependencies = { "google/vim-maktaba" } },

	-- LSP, Mason, Completion
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
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

			-- nvim-cmp
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

			-- Share cmp capabilities with all servers
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

			-- Server-specific configs
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
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

			vim.lsp.enable({
				"gopls",
				"pyright",
				"lua_ls",
				"yamlls",
				"bashls",
				"jdtls",
				"clangd",
				"sqlls",
			})

			-- Diagnostics
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

			-- LSP keymaps (Nvim 0.11 provides gd, K, grr, gra, grn, ]d, [d by default)
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
		end,
	},

	-- Flutter/Dart
	{
		"akinsho/flutter-tools.nvim",
		ft = { "dart" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("flutter-tools").setup({
				debugger = { enabled = true, run_via_dap = true },
				lsp = { capabilities = capabilities },
			})
		end,
	},

	-- Fidget (LSP progress)
	{ "j-hui/fidget.nvim", opts = {} },

	-- Formatter
	{
		"mhartington/formatter.nvim",
		config = function()
			local util = require("formatter.util")
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
						function()
							if util.get_current_buffer_file_name() == "special.lua" then
								return nil
							end
							return {
								exe = "stylua",
								args = {
									"--search-parent-directories",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
									"--",
									"-",
								},
								stdin = true,
							}
						end,
					},
					python = {
						function()
							return { exe = "black", args = { "--quiet", "-" }, stdin = true }
						end,
					},
					go = {
						function()
							return { exe = "goimports", args = {}, stdin = true }
						end,
					},
					dart = {
						function()
							return { exe = "dart", args = { "format" }, stdin = true }
						end,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})

			vim.api.nvim_exec(
				[[
				augroup FormatAutogroup
					autocmd!
					autocmd BufWritePost *.py,*.js,*.ts,*.html,*.css,*.go,*.lua,*.dart FormatWrite
				augroup END
			]],
				true
			)

			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.go",
				callback = function()
					vim.fn.jobstart({ "staticcheck", vim.fn.expand("%:p") }, {
						on_stdout = function(_, data)
							if data then
								for _, v in ipairs(data) do
									if v ~= "" then
										print(v)
									end
								end
							end
						end,
						stdout_buffered = true,
					})
				end,
			})
		end,
	},

	-- File tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>x", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
			{ "gx", "<cmd>NvimTreeFindFile<CR>", desc = "Find File in Tree" },
		},
		opts = {
			view = { width = "22%", relativenumber = true },
		},
	},

	-- Oil (floating file browser)
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = false,
			float = { padding = 2, max_width = 100, max_height = 40 },
			view_options = { show_hidden = true },
		},
	},

	-- Other.nvim (test file switching)
	{
		"rgroli/other.nvim",
		keys = {
			{ "<C-t>", "<cmd>Other<CR>", noremap = true, silent = true, desc = "Other File" },
		},
		config = function()
			require("other-nvim").setup({
				mappings = {
					{ pattern = "(.*).go$", target = "%1_test.go", context = "gototest" },
					{ pattern = "(.*)_test.go$", target = "%1.go", context = "gototest" },
					{ pattern = "(.*).py$", target = "%1_test.py", context = "pythongototest" },
					{ pattern = "(.*)_test.py$", target = "%1.py", context = "pythongototest" },
					{ pattern = "(.*).dart$", target = "%1_test.dart", context = "gototest" },
					{ pattern = "(.*)_test.dart$", target = "%1.dart", context = "gototest" },
					{ pattern = "(.*).sh$", target = "%1.json", context = "open sh response" },
					{ pattern = "(.*).json$", target = "%1.sh", context = "open json request" },
				},
				style = { border = "solid", seperator = "|", width = 0.7, minHeight = 2 },
			})
		end,
	},

	-- Comments
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	},

	-- ChatGPT
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "<leader>?", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
		},
		opts = {
			openai_params = { model = "gpt-4-1106-preview" },
		},
	},

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},

	-- Treesj (split/join)
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = { use_default_keymaps = false },
	},

	-- Outline
	{
		"hedyhli/outline.nvim",
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", noremap = true, silent = true, desc = "Outline" },
		},
		opts = {
			outline_items = { show_symbol_lineno = true },
			guides = { enabled = true },
		},
	},

	-- PlantUML preview
	{
		"weirongxu/plantuml-previewer.vim",
		build = "yarn install --frozen-lockfile",
		dependencies = {
			"aklt/plantuml-syntax",
			"tyru/open-browser.vim",
		},
		config = function()
			vim.g.plantuml_preview_image_format = "png"
			vim.g.plantuml_preview_output_directory = vim.fn.expand("~/.cache/plantuml")
			vim.g.plantuml_preview_open_output_file = 1
			vim.g.plantuml_preview_open_output_file_auto_delete = 1
			vim.g.plantuml_preview_dot = "dot"
			vim.g.plantuml_preview_cmd = "plantuml"
			vim.g.plantuml_preview_args = "-charset UTF-8"
			vim.g.plantuml_preview_mappings = { preview = "<F5>", refresh = "<F6>" }
		end,
	},

	-- Testing (vim-test + neotest)
	{ "vim-test/vim-test" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
			"sidlatau/neotest-dart",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
					require("neotest-python")({
						dap = { justMyCode = false },
						args = { "--log-level", "DEBUG" },
						runner = "pytest",
						python = ".venv/bin/python",
					}),
					require("neotest-dart")({
						command = "flutter",
						use_lsp = true,
					}),
				},
			})
			vim.keymap.set("n", "<leader>tr", require("neotest").run.run, {})
			vim.keymap.set("n", "<leader>tf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, {})
			vim.keymap.set("n", "<leader>to", function()
				require("neotest").output.open({ enter = true })
			end, {})
			vim.keymap.set("n", "<leader>tO", function()
				require("neotest").output_panel.toggle()
			end, {})
		end,
	},

	-- DAP (debugging)
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>tb", "<cmd>DapToggleBreakpoint<CR>")
			vim.keymap.set("n", "<leader>tc", "<cmd>DapContinue<CR>")
			vim.keymap.set("n", "<leader>tsn", "<cmd>DapStepOver<CR>")
			vim.keymap.set("n", "<leader>tso", "<cmd>DapStepOut<CR>")
			vim.keymap.set("n", "<leader>tsi", "<cmd>DapStepInto<CR>")
			vim.keymap.set("n", "<leader>tx", "<cmd>DapTerminate<CR>")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			vim.keymap.set("n", "<leader>tv", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end)
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = { "go" },
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {},
		keys = {
			{
				"<leader>tdg",
				function()
					require("dap-go").debug_test()
				end,
				desc = "Debug Go Test",
			},
			{
				"<leader>tdl",
				function()
					require("dap-go").debug_last()
				end,
				desc = "Debug Last Go Test",
			},
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		end,
		keys = {
			{
				"<leader>tdp",
				function()
					require("dap-python").test_method()
				end,
				desc = "Debug Python Test",
			},
		},
	},

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		opts = {
			window = { backdrop = 0.90, width = 190, height = 1 },
		},
	},

	-- Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.setup({
				filter = function(mapping)
					return mapping.desc and mapping.desc ~= ""
				end,
			})
			wk.add({
				{ "<leader>a", desc = "Harpoon Add" },
				{ "<leader>c", desc = "Copy relative path" },
				{ "<leader>C", desc = "Copy abs path" },
				{ "<leader>e", desc = "Harpoon Edit" },
				{ "<leader>f", desc = "Format" },
				{ "<leader>i", desc = "Next Diagnostic" },
				{ "<leader>I", desc = "Prev Diagnostic" },
				{ "<leader>j", desc = "Quickfix Next" },
				{ "<leader>J", desc = "Loclist Next" },
				{ "<leader>k", desc = "Quickfix Prev" },
				{ "<leader>K", desc = "Loclist Prev" },
				{ "<leader>m", desc = "Maximize Buffer" },
				{ "<leader>M", desc = "Equal Width" },
				{ "<leader>o", desc = "Outline" },
				{ "<leader>r", desc = "Registers" },
				{ "<leader>s", desc = "Split Vertical" },
				{ "<leader>u", desc = "Undo Tree" },
				{ "<leader>x", desc = "File Explorer" },
				{ "<leader>z", desc = "Zen Mode" },
				{ "<leader>?", desc = "ChatGPT" },
				{ "<leader>`", desc = "Terminal" },
				{ "<leader><leader>", desc = "Opened Buffers" },
				{ "<leader><CR>", desc = "Find File" },

				{ "<leader>d", group = "Document" },
				{ "<leader>dc", desc = "Classes" },
				{ "<leader>dm", desc = "Methods" },
				{ "<leader>do", desc = "Symbols" },
				{ "<leader>ds", desc = "Search" },
				{ "<leader>dv", desc = "Variables" },

				{ "<leader>g", group = "Git" },
				{ "<leader>g=", desc = "Stage All" },
				{ "<leader>g-", desc = "Unstage All" },
				{ "<leader>gb", desc = "Blame" },
				{ "<leader>gc", desc = "Checkout" },
				{ "<leader>gd", desc = "Diff Split" },
				{ "<leader>gD", desc = "Close Diff" },
				{ "<leader>gf", desc = "File Log" },
				{ "<leader>gl", desc = "Log" },
				{ "<leader>gM", desc = "Diff Main" },
				{ "<leader>gp", desc = "Pull" },
				{ "<leader>gP", desc = "Push" },
				{ "<leader>gr", desc = "Rebase" },
				{ "<leader>gs", desc = "Status" },
				{ "<leader>gz", group = "Stash" },
				{ "<leader>gz0", desc = "Apply stash@{0}" },
				{ "<leader>gz1", desc = "Apply stash@{1}" },
				{ "<leader>gz2", desc = "Apply stash@{2}" },

				{ "<leader>n", group = "New File" },
				{ "<leader>nt", desc = "New Tab" },
				{ "<leader>nx", desc = "New Horizontal" },
				{ "<leader>nv", desc = "New Vertical" },

				{ "<leader>p", group = "Project" },
				{ "<leader>pf", desc = "Files" },
				{ "<leader>pj", desc = "Jumplist" },
				{ "<leader>pl", desc = "Resume Last Search" },
				{ "<leader>po", desc = "Workspace Symbols" },
				{ "<leader>pr", desc = "Recent Files" },
				{ "<leader>ps", desc = "Grep" },
				{ "<leader>pm", desc = "Workspace Methods" },
				{ "<leader>pv", desc = "Workspace Variables" },
				{ "<leader>pc", desc = "Workspace Classes" },

				{ "<leader>t", group = "Test/Debug" },
				{ "<leader>tr", desc = "Run Nearest" },
				{ "<leader>tf", desc = "Run File" },
				{ "<leader>to", desc = "Output" },
				{ "<leader>tO", desc = "Output Panel" },
				{ "<leader>tb", desc = "Breakpoint" },
				{ "<leader>tc", desc = "Continue" },
				{ "<leader>td", group = "Debug Test" },
				{ "<leader>tdg", desc = "Go" },
				{ "<leader>tdp", desc = "Python" },
				{ "<leader>tdl", desc = "Last" },
				{ "<leader>ts", group = "Step" },
				{ "<leader>tsn", desc = "Over" },
				{ "<leader>tsi", desc = "Into" },
				{ "<leader>tso", desc = "Out" },
				{ "<leader>tx", desc = "Stop" },
				{ "<leader>tv", desc = "Variables" },

				{ "<leader>v", group = "Code Actions" },
				{ "<leader>va", desc = "Actions" },
				{ "<leader>vd", desc = "Diagnostics (loclist)" },
				{ "<leader>vi", desc = "Diagnostic Float" },
				{ "<leader>vl", desc = "LSP Restart" },
				{ "<leader>vr", desc = "Rename" },
				{ "<leader>vt", desc = "Generate Go Test" },
				{ "<leader>v/", desc = "Diff Split" },
				{ "<leader>vj", group = "JSON" },
				{ "<leader>vjf", desc = "Format" },
				{ "<leader>vjc", desc = "Clean K8s" },
				{ "<leader>vju", desc = "Count Unique" },
				{ "<leader>vs", group = "SQL" },
				{ "<leader>vsc", desc = "Expand Templates" },
			})
		end,
	},

	-- GoUnit
	{
		"hexdigest/gounit-vim",
		keys = {
			{ "<leader>vt", "<cmd>GoUnit<CR>", desc = "Generate Go Test" },
		},
	},

	-- OSCYank (clipboard over SSH)
	{ "ojroques/vim-oscyank" },
	-- install with yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
})
