return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "[F]ormat Buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			-- nvim
			lua = { "stylua" },

			-- linux
			c = { "clang-format" },
			sh = { "shellcheck", "shfmt" },

			-- web
			html = { "oxfmt" },
			css = { "oxfmt" },
			scss = { "oxfmt" },
			javascript = { "oxfmt" },
			typescript = { "oxfmt" },
			vue = { "oxfmt" },

			-- other
			json = { "oxfmt" },
			jsonc = { "oxfmt" },
			yaml = { "oxfmt" },
		},
		formatters = require("config.formatters"),
	},
}
