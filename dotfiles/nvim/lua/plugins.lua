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
    }
}
