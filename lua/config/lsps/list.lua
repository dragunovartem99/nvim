return {
	-- nvim
	lua_ls = {},
	-- linux
	clangd = {},
	bashls = {},
	-- web
	emmet_language_server = {},
	cssls = {},
	vue_ls = {
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		init_options = { vue = { hybridMode = false } },
	},
	eslint = {},
}
