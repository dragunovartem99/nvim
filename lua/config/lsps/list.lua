return {
	-- nvim
	lua_ls = {},
	-- linux
	clangd = {},
	bashls = {},
	-- web
	emmet_language_server = {},
	cssls = {},
	ts_ls = require("config.lsps.ts_ls"),
	vue_ls = {},
	stylelint_lsp = require("config.lsps.stylelint_lsp"),
	eslint = {},
}
