return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = {
				-- nvim
				"vim",
				"vimdoc",
				"lua",
				-- linux
				"c",
				"bash",
				-- web
				"json",
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"vue",
				-- other
				"query",
				"markdown",
				"markdown_inline",
				"yaml",
			},

			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
