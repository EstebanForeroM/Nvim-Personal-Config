vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set('n', '<leader>cd', function()
    -- Get the current working directory (absolute path)
    local cwd = vim.fn.getcwd()

    -- Copy the directory path to the clipboard
    vim.fn.setreg('+', cwd)

    -- Display a message indicating the directory path has been copied
    vim.api.nvim_echo({{'Directory path copied to clipboard: ' .. cwd, 'Normal'}}, true, {})
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- Allows me to move things around with J and K an i am in selection mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- This one is to use J and keep the cursor always in the postion in which it is already
vim.keymap.set("n", "J", "mzJ`z")

-- Next to travel over large files and keep the cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- This one is to keep search terms in the middle when you search with /
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- This one is to don't loose the current word when you paste it, so to use it you copy and paste with leader p
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Remaps to use the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

vim.keymap.set("v", "<leader><C-c>", "\"esc")

vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })
