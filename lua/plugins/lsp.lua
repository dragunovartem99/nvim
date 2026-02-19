local servers = require("config.lsps.list")
local formatters = require("config.formatters.list")

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = vim.tbl_keys(servers) } },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = formatters } },
	},
	config = function()
		for server_name, config in pairs(servers) do
			vim.lsp.config(server_name, config)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
	end,
}
