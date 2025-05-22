local servers = require("config.lsps.list")
local formatters = require("config.formatters.list")

return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = formatters } },
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true,
			handlers = {
				function(server_name)
					local server = servers[server_name]
					local blink = require("blink.cmp")

					server.capabilities = blink.get_lsp_capabilities(server.capabilities)
					vim.lsp.config(server_name, server)
				end,
			},
		})
	end,
}
