local ft = function (pattern, callback)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = pattern,
        callback = callback
    })
end

return {
    setup = function ()
        ft("nu", function()
            vim.bo.tabstop = 2
            vim.bo.shiftwidth = 2
            vim.bo.expandtab = true
        end)

        ft("json", function()
            vim.bo.tabstop = 2
            vim.bo.shiftwidth = 2
            vim.bo.expandtab = true
        end)
    end
}
