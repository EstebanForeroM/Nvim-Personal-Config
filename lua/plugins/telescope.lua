return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- Ensure nvim-lint is installed if not already
    'mfussenegger/nvim-lint',
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local lint = require("lint")

    telescope.setup({
      defaults = {
        prompt_prefix = '  ',
        selection_caret = ' ',
        path_display = { 'smart' },
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          },
        },
        layout_config = {
          horizontal = { preview_width = 0.6 },
          vertical = { width = 0.5 },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
      },
    })

    pcall(telescope.load_extension, 'fzf')

    -- Project related mappings
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = '[P]roject [G]it Files' })
    vim.keymap.set('n', '<leader>ps', function()
      local input = vim.fn.input("Grep > ")
      if input == "" then
        builtin.live_grep()
      else
        builtin.live_grep({ default_text = input })
      end
    end, { desc = '[P]roject [S]earch in project' })
    vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = '[P]roject [B]uffers' })
    vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = '[P]roject [H]elp tags' })
    vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = '[P]roject [K]eymaps' })
    vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = '[P]roject [R]esume last search' })

    -- LSP Diagnostics - Errors
    vim.keymap.set('n', '<leader>pe', function()
      builtin.diagnostics({
        bufnr = 0,
        severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR },
      })
    end, { desc = '[P]roject [E]rrors (LSP) in current file' })
    vim.keymap.set('n', '<leader>pE', function()
      builtin.diagnostics({
        severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR },
      })
    end, { desc = '[P]roject [E]rrors (LSP) in all open buffers' })

    -- LSP Diagnostics - Warnings
    vim.keymap.set('n', '<leader>pw', function()
      builtin.diagnostics({
        bufnr = 0,
        severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.WARN },
      })
    end, { desc = '[P]roject [W]arnings (LSP) in current file' })
    vim.keymap.set('n', '<leader>pW', function()
      builtin.diagnostics({
        severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.WARN },
      })
    end, { desc = '[P]roject [W]arnings (LSP) in all open buffers' })

    -- LSP related pickers
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP References' })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'LSP Definitions' })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'LSP Implementations' })
    vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = 'LSP Type Definitions' })

    -- Custom picker to show currently running linters
    vim.keymap.set('n', '<leader>pl', function()
      local running_linters = lint.get_running()

      if #running_linters == 0 then
        -- If no linters are running, show a simple message
        print("No linters currently running.")
        return
      end

      require('telescope.pickers').new({}, {
        prompt_title = "Currently Running Linters",
        finder = require('telescope.finders').new_table {
          results = running_linters,
        },
        sorter = require('telescope.config').values.generic_sorter({}),
      }):find()
    end, { desc = '[P]roject [L]inters currently running' })

  end
}

