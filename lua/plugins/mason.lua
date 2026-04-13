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
		opts = {
			ensure_installed = vim.tbl_filter(function(server)
				return not manually_installed[server]
			end, vim.tbl_keys(servers)),
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = { ensure_installed = vim.tbl_keys(formatters) },
	},
}
