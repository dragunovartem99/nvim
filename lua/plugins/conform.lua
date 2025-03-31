return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format()
			end,
			desc = "[F]ormat Buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			-- vim
			lua = { "stylua" },
			-- web
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
			-- other
			yaml = { "prettier" },
		},
	},
}
