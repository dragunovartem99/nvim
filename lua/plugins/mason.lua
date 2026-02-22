local servers = require("config.lsps")
local formatters = require("config.formatters")

return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = { ensure_installed = vim.tbl_keys(servers) },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = { ensure_installed = vim.tbl_keys(formatters) },
	},
}
