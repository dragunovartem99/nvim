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
			-- nvim
			lua = { "stylua" },
			-- linux
			sh = { "shfmt" },
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
		formatters = {
			prettier = {
				prepend_args = {
					"--print-width 100",
					"--tab-width 4",
					"--use-tabs",
					"--trailing-comma es5",
				},
			},
			shfmt = { prepend_args = { "-ci", "-sr" } },
		},
	},
}
