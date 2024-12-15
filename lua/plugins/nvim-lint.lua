return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Configure linters by filetype
      lint.linters_by_ft = {
        rust = {"clippy"},
        go = {"golangcilint"},
      }

      -- Function to return a string of currently running linters
      local function lint_progress()
        local linters = lint.get_running()
        if #linters == 0 then
          -- No linters currently running
          return ""
        end
        -- e.g., "󱉶 clippy" if clippy is running
        return "󱉶 " .. table.concat(linters, ", ")
      end

      -- Example: Integrate with your statusline
      -- If you're using a simple statusline, you might do something like:
      -- vim.o.statusline = "%f %m%r%h%w [%"..lint_progress().."]%y%=%l,%c%V %P"
      --
      -- For a more dynamic solution, integrate lint_progress() with your statusline plugin
      -- like lualine or feline.

      -- Run linting on save
      vim.api.nvim_create_autocmd({"BufWinEnter", "BufWritePost"}, {
        callback = function()
          require('lint').try_lint()
        end,
      })


      -- If you want to trigger linting with a keymap:
      -- vim.keymap.set('n', '<leader>l', function() lint.try_lint() end, { desc = "Run linters" })

      -- Optional: Configure diagnostic display
      -- vim.diagnostic.config({
      --   virtual_text = true,
      --   signs = true,
      --   update_in_insert = false,
      -- })

      -- Make lint_progress function accessible globally or in your statusline config
      _G.lint_progress = lint_progress
    end,
  },
}

