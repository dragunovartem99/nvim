local servers = require("config.lsps.list")

return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = require("config.formatters.list"),
		})
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true,
			handlers = {
				function(server_name)
					local server = servers[server_name]
					server.capabilities =
						require("blink.cmp").get_lsp_capabilities(server.capabilities)
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
