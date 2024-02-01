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
