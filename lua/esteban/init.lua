require("esteban.remap")
require("esteban.set")
vim.env.PATH = vim.env.PATH .. ':/home/your-username/.ghcup/bin'

vim.api.nvim_create_augroup('YankHighlight', {})

-- Enable true color support
vim.opt.termguicolors = true

-- Define a custom highlight group with yellow background
vim.api.nvim_set_hl(0, 'YankHighlightGroup', { fg = '#000000', bg = 'cyan' })
-- the fg is the text color and the bg is the background color of the highlight
-- yes you can change the text color too

-- Create an autogroup for yank highlighting
vim.api.nvim_create_augroup('YankHighlight', {})

-- Set up an autocommand to highlight yanked text using the custom highlight group
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankHighlight',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'YankHighlightGroup',
      timeout = 30,  -- Duration in milliseconds
    }
  end,
})
