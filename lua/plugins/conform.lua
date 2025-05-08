local filetypes = require("config.formatters.filetypes")
local prettier = require("config.formatters.prettier");
local clang_format = require("config.formatters.clang_format");

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
		formatters_by_ft = filetypes,
		formatters = {
			prettier = prettier,
			["clang-format"] = clang_format,
			shfmt = {
				-- https://github.com/patrickvane/shfmt
				prepend_args = { "-ci", "-sr" },
			},
		},
	},
}
