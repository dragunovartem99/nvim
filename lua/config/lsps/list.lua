-- https://github.com/vuejs/language-tools
local vue_lsp_location = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

return {
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
	vue_ls = {},
	eslint = {},
}
