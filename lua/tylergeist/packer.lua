--"help",  This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use("christoomey/vim-tmux-navigator")
    use('nvim-tree/nvim-web-devicons')
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('m4xshen/autoclose.nvim')
    use('github/copilot.vim')
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
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }


    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
        },
        config = function()
            require("barbecue").setup({
                theme = {
                    -- this highlight is used to override other highlights
                    -- you can take advantage of its `bg` and set a background throughout your winbar
                    -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
                    normal = { fg = "#c0caf5" },

                    -- these highlights correspond to symbols table from config
                    ellipsis = { fg = "#737aa2" },
                    separator = { fg = "#737aa2" },
                    modified = { fg = "#737aa2" },

                    -- these highlights represent the _text_ of three main parts of barbecue
                    dirname = { fg = "#737aa2" },
                    basename = { bold = true },
                    context = {},

                    -- these highlights are used for context/navic icons
                    context_file = { fg = "#ac8fe4" },
                    context_module = { fg = "#ac8fe4" },
                    context_namespace = { fg = "#ac8fe4" },
                    context_package = { fg = "#ac8fe4" },
                    context_class = { fg = "#ac8fe4" },
                    context_method = { fg = "#ac8fe4" },
                    context_property = { fg = "#ac8fe4" },
                    context_field = { fg = "#ac8fe4" },
                    context_constructor = { fg = "#ac8fe4" },
                    context_enum = { fg = "#ac8fe4" },
                    context_interface = { fg = "#ac8fe4" },
                    context_function = { fg = "#ac8fe4" },
                    context_variable = { fg = "#ac8fe4" },
                    context_constant = { fg = "#ac8fe4" },
                    context_string = { fg = "#ac8fe4" },
                    context_number = { fg = "#ac8fe4" },
                    context_boolean = { fg = "#ac8fe4" },
                    context_array = { fg = "#ac8fe4" },
                    context_object = { fg = "#ac8fe4" },
                    context_key = { fg = "#ac8fe4" },
                    context_null = { fg = "#ac8fe4" },
                    context_enum_member = { fg = "#ac8fe4" },
                    context_struct = { fg = "#ac8fe4" },
                    context_event = { fg = "#ac8fe4" },
                    context_operator = { fg = "#ac8fe4" },
                    context_type_parameter = { fg = "#ac8fe4" },
                },
            })
        end,
    })

    use('NvChad/nvim-colorizer.lua')
    use('HiPhish/nvim-ts-rainbow2')
    use('windwp/nvim-ts-autotag')
end)
