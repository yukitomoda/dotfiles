return {
    "folke/tokyonight.nvim",
    config = function()
        vim.cmd([[colorscheme tokyonight]])
        require('tokyonight').setup{
            transparent = vim.g.transparent_enabled,
            styles = {
                comments = { italic = false },
            },
            on_colors = function (colors)
                colors.comment = '#559977'
            end,
            on_highlights = function (hl, c)
                hl.Comment = {
                    fg = c.comment
                }
            end
        }
    end,
    opts = {
        style = "storm"
    }
}
