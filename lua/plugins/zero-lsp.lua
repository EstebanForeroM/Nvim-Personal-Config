return {
	{
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x'
	},
	{
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "hrsh7th/nvim-cmp",
	  'hrsh7th/cmp-nvim-lsp',
	  'hrsh7th/cmp-buffer',
	  'hrsh7th/cmp-path',
	  'hrsh7th/cmp-cmdline',
	  'hrsh7th/nvim-cmp',
	  "rafamadriz/friendly-snippets",
	  "hrsh7th/cmp-nvim-lua",
	  "saadparwaiz1/cmp_luasnip",
      "neovim/nvim-lspconfig",
	},
	{
	  "L3MON4D3/LuaSnip",
	  version = "v2.*", -- follow latest release.
	  -- install jsregexp (optional!).
	  build = "make install_jsregexp"
	}
  }
