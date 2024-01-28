return {
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
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local neogit = require('neogit')
            neogit.setup { }
            vim.keymap.set('n', '<Leader>g', neogit.open)
        end,
        keys = {
            '<Leader>g'
        }
    },
    {
        'lewis6991/gitsigns.nvim'
    }
}
