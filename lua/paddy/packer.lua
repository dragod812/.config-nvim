vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "smartpde/telescope-recent-files" })

	use({ "catppuccin/nvim", as = "catppuccin" })

	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("github/copilot.vim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use("hexdigest/gounit-vim")
	use("ojroques/vim-oscyank")

	use({
		"folke/flash.nvim",
		config = function()
			require("flash").setup()
		end,
	})

	-- bazel support
	use("google/vim-maktaba")
	use("bazelbuild/vim-bazel")

	-- LSP & completion (no lsp-zero, native Nvim 0.11 setup)
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		run = function()
			pcall(vim.cmd, "MasonUpdate")
		end,
	})
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("j-hui/fidget.nvim")
	use("mhartington/formatter.nvim")

	use({
		"akinsho/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = "22%",
					relativenumber = true,
				},
			})
		end,
	})
	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = false,
				float = {
					padding = 2,
					max_width = 100,
					max_height = 40,
				},
				view_options = {
					show_hidden = true,
				},
			})
		end,
	})
	use({
		"rgroli/other.nvim",
		config = function()
			require("other-nvim").setup({
				mappings = {
					{
						pattern = "(.*).go$",
						target = "%1_test.go",
						context = "gototest",
					},
					{
						pattern = "(.*)_test.go$",
						target = "%1.go",
						context = "gototest",
					},
					{
						pattern = "(.*).py$",
						target = "%1_test.py",
						context = "pythongototest",
					},
					{
						pattern = "(.*)_test.py$",
						target = "%1.py",
						context = "pythongototest",
					},
					{
						pattern = "(.*).dart$",
						target = "%1_test.dart",
						context = "gototest",
					},
					{
						pattern = "(.*)_test.dart$",
						target = "%1.dart",
						context = "gototest",
					},
					{
						pattern = "(.*).sh$",
						target = "%1.json",
						context = "open sh response",
					},
					{
						pattern = "(.*).json$",
						target = "%1.sh",
						context = "open json request",
					},
				},
				style = {
					border = "solid",
					seperator = "|",
					width = 0.7,
					minHeight = 2,
				},
			})
		end,
	})

	use("terrortylor/nvim-comment")

	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				openai_params = {
					model = "gpt-4-1106-preview",
				},
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	use({
		"Wansmer/treesj",
		requires = { "nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	})
	use({
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({
				outline_items = {
					show_symbol_lineno = true,
				},
				guides = {
					enabled = true,
				},
			})
		end,
	})

	-- plantuml preview
	use({
		"weirongxu/plantuml-previewer.vim",
		run = "yarn install --frozen-lockfile",
		config = function()
			vim.g.plantuml_preview_image_format = "png"
			vim.g.plantuml_preview_output_directory = vim.fn.expand("~/.cache/plantuml")
			vim.g.plantuml_preview_open_output_file = 1
			vim.g.plantuml_preview_open_output_file_auto_delete = 1
			vim.g.plantuml_preview_dot = "dot"
			vim.g.plantuml_preview_cmd = "plantuml"
			vim.g.plantuml_preview_args = "-charset UTF-8"
			vim.g.plantuml_preview_mappings = {
				preview = "<F5>",
				refresh = "<F6>",
			}
		end,
	})
	use("aklt/plantuml-syntax")
	use("tyru/open-browser.vim")

	-- test plugins
	use("vim-test/vim-test")
	use({
		"nvim-neotest/neotest",
		requires = {
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
		end,
	})
	use("mfussenegger/nvim-dap")
	use({
		"leoluz/nvim-dap-go",
		ft = { "go" },
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup({})
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
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
		end,
	})
	use({
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		requires = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		end,
	})

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 0.90,
					width = 190,
					height = 1,
				},
			})
		end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})
end)
