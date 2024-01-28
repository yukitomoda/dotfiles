return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep'
    },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<Leader>o', builtin.find_files)
        vim.keymap.set('n', '<Leader>tg', builtin.live_grep)
        vim.keymap.set('n', '<Leader>td', builtin.lsp_document_symbols)
        vim.keymap.set('n', '<Leader>f', function()
            builtin.live_grep{ skip_empty_lines = true }
        end)
        vim.keymap.set('n', '<Leader>:', builtin.commands)
        vim.keymap.set('n', '<Leader>^', builtin.quickfix)
        vim.api.nvim_create_user_command('Highlights', builtin.highlights, {})
        vim.api.nvim_create_user_command('GitLog', builtin.git_commits, {})
        vim.api.nvim_create_user_command('Help', builtin.help_tags, {})
    end
}
