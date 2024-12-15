return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },  -- Load nvim-lint when reading or creating new files
    config = function()
      local lint = require("lint")

      -- Set linters by filetype:
      lint.linters_by_ft = {
        rust = {"clippy"},       -- Uses Rust's clippy linter
        go = {"golangcilint"},   -- Uses golangci-lint for Go
      }

      -- Configure an autocmd to run linting on save
      vim.api.nvim_create_autocmd({"BufWritePost"}, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- Optionally, you can run specific linters regardless of filetype:
      -- For example, after normal linting:
      -- lint.try_lint("cspell")

      -- If you want to customize diagnostic display:
      -- vim.diagnostic.config({
      --   virtual_text = true,
      --   signs = true,
      --   update_in_insert = false,
      -- })

    end,
  },
}

