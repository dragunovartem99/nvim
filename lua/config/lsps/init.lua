return {
	-- nvim
	lua_ls = require("config.lsps.lua_ls"),
	stylua = {},

	-- linux
	clangd = {},
	bashls = require("config.lsps.bashls"),

	-- web
	emmet_language_server = {},
	cssls = {},
	ts_ls = require("config.lsps.ts_ls"),
	vue_ls = {},

	oxfmt = {},
	oxlint = {},
	eslint = {},
	stylelint_lsp = require("config.lsps.stylelint_lsp"),

	-- other
	jsonls = {},
}
