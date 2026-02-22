local formatters = require("config.formatters")

-- both LSPs and CLI formatters are used
local conform_by_ft = "formatters_by_ft"

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
		[conform_by_ft] = {
			-- nvim
			lua = { "stylua" },

			-- linux
			c = { "clang-format" },
			sh = { "shfmt" },

			-- web
			json = { "prettier" },
			jsonc = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },

			-- other
			yaml = { "prettier" },
		},
		formatters,
	},
}
