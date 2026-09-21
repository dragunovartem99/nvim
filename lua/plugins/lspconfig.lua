local servers = require("config.lsps")

return {
	"neovim/nvim-lspconfig",
	config = function()
		for server_name, config in pairs(servers) do
			vim.lsp.config(server_name, config)
		end

		vim.lsp.enable(vim.tbl_keys(servers))

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("personal-lsp-tokens", { clear = true }),
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				-- ./treesitter.lua - better and faster than LSP tokens
				if client then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
		})
	end,
}
