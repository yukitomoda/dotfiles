return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'lua',
                    'vimdoc'
                },
                highlight = {
                    enable = true
                }
            }

            local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

            parser_config.nu = {
                install_info = {
                    url = "https://github.com/nushell/tree-sitter-nu",
                    files = { "src/parser.c" },
                    branch = "main"
                },
                filetype = "nu"
            }

        end
    }
}
