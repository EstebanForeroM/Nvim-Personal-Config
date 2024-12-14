return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      go = { "gofmt" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}

