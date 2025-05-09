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
		formatters_by_ft = require("config.formatters.filetypes"),
		formatters = {
			prettier = require("config.formatters.prettier"),
			["clang-format"] = require("config.formatters.clang-format"),
			shfmt = {
				-- https://github.com/patrickvane/shfmt
				prepend_args = { "-ci", "-sr" },
			},
		},
	},
}
