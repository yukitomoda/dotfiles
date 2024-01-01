return {
    'nathom/filetype.nvim',
    config = function()
        require("filetype").setup({
            overrides = {
                extensions = {
                    -- key: extensions
                    -- value: filetype
                    nu = "nu",
                },
                literal = {
                    -- key: filename
                    -- value: filetype
                },
                complex = {
                    -- key: regex for fullpath
                    -- value: filetype
                    [".*git/config"] = "gitconfig", -- Included in the plugin
                },

                -- The same as the ones above except the keys map to functions
                function_extensions = {
                    ["json"] = function()
                        vim.bo.tabstop = 2
                        vim.bo.shiftwidth = 2
                        vim.bo.expandtab = true
                    end,
                },
                function_literal = {
                    -- key: filename
                    -- value: action
                },
                function_complex = {
                    -- key: regex for fullpath
                    -- value: action
                },

                shebang = {
                },
            },
        })
    end
}
