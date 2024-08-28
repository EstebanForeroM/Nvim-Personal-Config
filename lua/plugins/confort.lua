return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" }, 
  -- Everything in opts will be passed to setup()
  opts = {

    -- Define your formatters
    formatters_by_ft = {
      rust = { "rustfmt" },
    },

    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  },
}
