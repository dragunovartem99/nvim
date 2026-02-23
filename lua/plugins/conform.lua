local function web_formatter()
	return { "oxfmt", "prettier", stop_after_first = true }
end

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
			html = web_formatter(),
			css = web_formatter(),
			scss = web_formatter(),
			javascript = web_formatter(),
			typescript = web_formatter(),
			vue = web_formatter(),

			-- other
			json = web_formatter(),
			jsonc = web_formatter(),
			yaml = web_formatter(),
		},
		formatters = require("config.formatters"),
	},
}
