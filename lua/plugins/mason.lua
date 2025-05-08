-- https://github.com/vuejs/language-tools
local vue_lsp_location = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local servers = {
	-- nvim
	lua_ls = {},
	-- linux
	clangd = {},
	bashls = {},
	-- web
	emmet_language_server = {},
	cssls = {},
	ts_ls = {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vue_lsp_location,
					languages = { "vue" },
				},
			},
		},
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	},
	volar = {},
	eslint = {},
}

local tools = { "stylua", "prettier", "shfmt", "clang-format" }

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
		require("mason-tool-installer").setup({ ensure_installed = tools })
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
