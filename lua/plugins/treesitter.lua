return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.config").setup({
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = require("config.parsers.list"),

			sync_install = false,
			auto_install = true,

			highlight = { enable = true, additional_vim_regex_highlighting = false },
		})
	end,
}
