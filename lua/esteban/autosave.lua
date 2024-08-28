-- Automatically save the buffer when opening Telescope or changing files
local function autosave()
    vim.cmd('silent! write')
end

-- Save the buffer before opening Telescope
vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = 'TelescopePreviewerLoaded',
    callback = function()
        autosave()
    end,
})

-- Save the buffer when changing files
vim.api.nvim_create_autocmd({ 'BufLeave', 'WinLeave' }, {
    callback = function()
        autosave()
    end,
})
