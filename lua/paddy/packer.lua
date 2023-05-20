-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only equired if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'lalitmee/cobalt2.nvim',
        requires = 'tjdevries/colorbuddy.nvim',
    }

    use('theprimeagen/harpoon')
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("github/copilot.vim")
    use('nvim-treesitter/nvim-treesitter')
    use('nvim-treesitter/nvim-treesitter-context')
    -- install gounit binary - go install  github.com/hexdigest/gounit/cmd/gounit@latest
    use('hexdigest/gounit-vim')
    use('ojroques/vim-oscyank')
    use('gennaro-tedesco/nvim-peekup')



    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'asdfghjkl;zxcvbnm,.qwertyuiop' }
        end
    }

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
    }


    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {
                view = {
                    width = "20%",
                    relativenumber = true,
                }
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
                        context = "gototest"
                    },
                    {
                        pattern = "(.*)_test.py$",
                        target = "%1.py",
                        context = "gototest"
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
end)
