return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      -- Configure linters by filetype
      require('lint').linters_by_ft = {
        markdown = {'vale'}, -- Example: Using 'vale' for markdown files
        rust = {'clippy'}

      }

      local lint_progress = function()
        local linters = require("lint").get_running()
        if #linters == 0 then
          return "󰦕"
        end
        return "󱉶 " .. table.concat(linters, ", ")
      end

      -- Setup autocmd for linting on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          -- Run linters based on `linters_by_ft`
          require("lint").try_lint()

          -- Example: Always run a specific linter (e.g., cspell)
          -- require("lint").try_lint("cspell")
        end,
      })
    end,
  }
}

