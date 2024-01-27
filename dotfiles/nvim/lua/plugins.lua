return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd([[colorscheme tokyonight]])
            require('tokyonight').setup{
                transparent = vim.g.transparent_enabled
            }
        end,
        opts = {
            style = "storm"
        }
    },
    {
        'xiyaowong/transparent.nvim',
        config = function()
            require('transparent').setup{}
            vim.cmd([[TransparentEnable]])
        end
    },
    {
        "kdheepak/tabline.nvim"
    },
    {
        'echasnovski/mini.indentscope',
        version = '*',
        opts = {
            draw = {
                delay = 100
            }
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
        -- TODO
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
            "ibhagwan/fzf-lua",
        },
        config = function()
          local neogit = require('neogit')
          neogit.setup()
          vim.keymap.set('n', '<Leader>g', neogit.open)
        end,
        keys = {
            '<Leader>g'
        }
    }
}
