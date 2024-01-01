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
}
