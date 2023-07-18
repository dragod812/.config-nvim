-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only equired if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {"smartpde/telescope-recent-files"}


    -- use {
    --     'lalitmee/cobalt2.nvim',
    --     requires = 'tjdevries/colorbuddy.nvim',
    -- }
    use { "catppuccin/nvim", as = "catppuccin" }

    use('theprimeagen/harpoon')
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("github/copilot.vim")
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use('nvim-treesitter/nvim-treesitter-context')
    -- install gounit binary - go install  github.com/hexdigest/gounit/cmd/gounit@latest
    use('hexdigest/gounit-vim')
    use('ojroques/vim-oscyank')

    -- flash.nvim
    use {
        "folke/flash.nvim",
        config = function()
            require("flash").setup()
        end
    }

    -- bazel support
    use('google/vim-maktaba')
    use('bazelbuild/vim-bazel')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
            { 'j-hui/fidget.nvim' },
        }
    }

    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = function()
            require('flutter-tools').setup {
                debugger = {
                    enabled = true,
                    run_via_dap = true
                },
            }
        end
    }


    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {
                view = {
                    width = "22%",
                    relativenumber = true,
                },
                remove_keymaps = { "s" }
            }
        end
    }
    use {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup(
                {
                    default_file_explorer = false,
                    float = {
                        padding = 2,
                        max_width = 100,
                        max_height = 40
                    },
                    view_options = {
                        show_hidden = true,
                    }
                }
            )
        end
    }
    use {
        'rgroli/other.nvim',
        config = function()
            require("other-nvim").setup({
                mappings = {
                    -- golang, python & dart custom mapping
                    {
                        pattern = "(.*).go$",
                        target = "%1_test.go",
                        context = "gototest"
                    },
                    {
                        pattern = "(.*)_test.go$",
                        target = "%1.go",
                        context = "gototest"
                    },
                    {
                        pattern = "(.*).py$",
                        target = "%1_test.py",
                        context = "pythongototest"
                    },
                    {
                        pattern = "(.*)_test.py$",
                        target = "%1.py",
                        context = "pythongototest"
                    },
                    {
                        pattern = "(.*).dart$",
                        target = "%1_test.dart",
                        context = "gototest"
                    },
                    {
                        pattern = "(.*)_test.dart$",
                        target = "%1.dart",
                        context = "gototest"
                    },
                    {
                        pattern = "(.*).sh$",
                        target = "%1.json",
                        context = "open sh response"
                    },
                    {
                        pattern = "(.*).json$",
                        target = "%1.sh",
                        context = "open json request"
                    },

                },
                style = {
                    -- How the plugin paints its window borders
                    -- Allowed values are none, single, double, rounded, solid and shadow
                    border = "solid",
                    -- Column seperator for the window
                    seperator = "|",
                    -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
                    width = 0.7,
                    -- min height in rows.
                    -- when more columns are needed this value is extended automatically
                    minHeight = 2
                },
            })
        end

    }


    use "terrortylor/nvim-comment"

    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup(
                {
                    openai_params = {
                        model = "gpt-3.5-turbo-0301",
                    }
                }
            )
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        }
    })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter' },
        config = function()
            require('treesj').setup({
                use_default_keymaps = false,
            })
        end,
    })
    use({
        'simrat39/symbols-outline.nvim',
        config = function()
            require('symbols-outline').setup({
                highlight_hovered_item = true,
                show_guides = true,
                show_numbers = true,
                show_relative_numbers = true,
            })
        end
    })

    -- plantuml preview requirements
    use({
        'weirongxu/plantuml-previewer.vim',
        run = 'yarn install --frozen-lockfile',
        config = function()
            vim.g.plantuml_preview_image_format = 'png'
            vim.g.plantuml_preview_output_directory = vim.fn.expand('~/.cache/plantuml')
            vim.g.plantuml_preview_open_output_file = 1
            vim.g.plantuml_preview_open_output_file_auto_delete = 1
            vim.g.plantuml_preview_dot = 'dot'
            vim.g.plantuml_preview_cmd = 'plantuml'
            vim.g.plantuml_preview_args = '-charset UTF-8'
            vim.g.plantuml_preview_mappings = {
                preview = '<F5>',
                refresh = '<F6>',
            }
        end
    })
    use('aklt/plantuml-syntax')
    use('tyru/open-browser.vim')

    -- test plugins
    use('vim-test/vim-test')
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
            'sidlatau/neotest-dart',
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
            -- Your other test adapters here
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
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
                -- your neotest config here
                adapters = {
                    require("neotest-go"),
                    require("neotest-python")({
                        -- Extra arguments for nvim-dap configuration
                        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
                        dap = { justMyCode = false },
                        -- Command line arguments for runner
                        -- Can also be a function to return dynamic values
                        args = { "--log-level", "DEBUG" },
                        -- Runner to use. Will use pytest if available by default.
                        -- Can be a function to return dynamic value.
                        runner = "pytest",
                        -- Custom python path for the runner.
                        -- Can be a string or a list of strings.
                        -- Can also be a function to return dynamic value.
                        -- If not provided, the path will be inferred by checking for
                        -- virtual envs in the local directory and for Pipenev/Poetry configs
                        python = ".venv/bin/python",
                        -- Returns if a given file path is a test file.
                        -- NB: This function is called a lot so don't perform any heavy tasks within it.
                    }),
                    require('neotest-dart') {
                        command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
                        -- Change it to `fvm flutter` if using FVM
                        -- change it to `dart` for Dart only tests
                        use_lsp = true -- When set Flutter outline information is used when constructing test name.
                    },
                },
            })
        end,
    })
    use {
        'mfussenegger/nvim-dap',
    }
    use {
        'leoluz/nvim-dap-go',
        ft = { 'go' },
        requires = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            require('dap-go').setup({
                ensure_installed = {
                    "gopls",
                },
            })
            -- require("core.utils").load_mappings("dap_go")
        end
    }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use {
        'mfussenegger/nvim-dap-python',
        ft = { 'python' },
        requires = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui'
        },
        config = function()
            -- install debugpy from mason
            require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
        end
    }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require('zen-mode').setup({
                window = {
                    backdrop = 0.90, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    -- height and width can be:
                    -- * an absolute number of cells when > 1
                    -- * a percentage of the width / height of the editor when <= 1
                    width = 190, -- width of the Zen window
                    height = 1,  -- height of the Zen window
                    -- by default, no options are changed for the Zen window
                    -- uncomment any of the options below, or add other vim.wo options you want to apply
                    options = {
                        -- signcolumn = "no", -- disable signcolumn
                        -- number = false, -- disable number column
                        -- relativenumber = false, -- disable relative numbers
                        -- cursorline = false, -- disable cursorline
                        -- cursorcolumn = false, -- disable cursor column
                        -- foldcolumn = "0", -- disable fold column
                        -- list = false, -- disable whitespace characters
                    },
                },
            })
        end
    }
    use {
        'wthollingsworth/pomodoro.nvim',
        requires = 'MunifTanjim/nui.nvim',
        config = function()
            require('pomodoro').setup({
                time_work = 28,
                time_break_short = 2,
                time_break_long = 20,
                timers_to_long_break = 4
            })
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                ignore_missing = true,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)
