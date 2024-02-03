vim.api.nvim_create_autocmd({"TermOpen"}, {
    pattern = {"term://*"},
    callback = function(ev)
        local opts = {buffer = 0}
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end
})

return {
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup{
            open_mapping = [[<c-\>]]
        }

        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new{
            cmd = 'lazygit',
            hidden = true,
            direction = 'float',
            on_open = function(term)
                vim.cmd[[startinsert!]]
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
            end
        }
        local function lazygit_toggle()
            lazygit:toggle()
        end

        vim.keymap.set('n', '<Leader>G', lazygit_toggle, { silent = true })
        vim.keymap.set('n', '<Leader>#', function()
            local term = Terminal:new{}
            term:open()
        end, { silent = true })
    end,
    lazy = true,
    keys = {
        '<Leader>G',
        '<Leader>#'
    }
}
