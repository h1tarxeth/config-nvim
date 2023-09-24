return {

    { 'numToStr/Comment.nvim', opts = {} },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    { 'folke/which-key.nvim',  opts = {} },
    {'christoomey/vim-tmux-navigator',
        lazy = false,
    },
    {
        'rose-pine/neovim',
        priority = 1000,
        config = function()
            vim.cmd('colorscheme rose-pine')
        end,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local bufferline = require("bufferline")

            bufferline.setup()
        end,
    },

    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()

            local terminal = require("nvterm.terminal")
            local toggle_modes = { 'n', 't' }
            local mappings = {
                { toggle_modes, '<A-h>', function() terminal.toggle('horizontal') end },
                { toggle_modes, '<A-v>', function() terminal.toggle('vertical') end },
                { toggle_modes, '<A-i>', function() terminal.toggle('float') end },
            }
            local opts = { noremap = true, silent = true }
            for _, mapping in ipairs(mappings) do
                vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
            end
        end,
    },

    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

    {
        "ThePrimeagen/vim-be-good",
        lazy = false,
    },

    {
        "theprimeagen/harpoon",
        config = function()
            require("telescope").load_extension('harpoon')
        end,
    },

    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            vim.g.copilot_assume_mapped = true
        end,
    },

    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require 'colorizer'.setup {
                filetypes = {
                    'css',
                    'javascript',
                    html = { mode = 'foreground', }
                },
            }
        end,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                sort_by = "case_sensitive",
                view = { width = 30, },
                renderer = { group_empty = true, },
                filters = { dotfiles = true, }, }
        end,
    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
            end,
        },
    },

    --
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "mhartington/formatter.nvim",
        event = "VeryLazy",
        opts = function()
            return require "formatter"
        end
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            require "lint"
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "eslint-lsp",
                "prettier",
                "typescript-language-server"
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "lspconfig"
        end,
    },
    'folke/neodev.nvim', -- new

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },


    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'rose-pine',
                component_separators = '|',
                section_separators = '',
                disabled_filetypes = { 'packer', 'NVimTree' },
            },
        },
    },
}
