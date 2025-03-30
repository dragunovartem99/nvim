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
			json = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			vue = { "prettierd" },
			-- other
			yaml = { "prettierd" },
		},
	},
}
