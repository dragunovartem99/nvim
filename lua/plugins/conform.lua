return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>F",
			function()
				-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md
				require("conform").format({ async = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(
								vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
								"n",
								true
							)
						end
					end
				end)
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
