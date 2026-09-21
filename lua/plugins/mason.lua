local servers = require("config.lsps")
local formatters = require("config.formatters")

local manually_installed = {
	stylelint_lsp = true,
}

return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			-- ./lspconfig.lua enables servers explicitly
			automatic_enable = false,
			ensure_installed = vim.tbl_filter(function(server)
				return not manually_installed[server]
			end, vim.tbl_keys(servers)),
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = { ensure_installed = vim.tbl_keys(formatters) },
	},
}
