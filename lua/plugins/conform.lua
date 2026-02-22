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
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },

			-- other
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
		},
		formatters = require("config.formatters"),
	},
}
