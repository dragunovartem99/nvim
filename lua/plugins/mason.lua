local servers = {
	-- nvim
	lua_ls = {},
	-- linux
	clangd = {},
	bashls = {},
	-- web
	emmet_language_server = {},
	cssls = {},
	ts_ls = {},
	volar = {
		filetypes = { "vue" },
		init_options = { vue = { hybridMode = false } },
	},
}

local tools = {
	"stylua",
	"prettierd",
}

return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({ ensure_installed = tools })
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true,
			handlers = {
				function(server_name)
					local server = servers[server_name]
					server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
