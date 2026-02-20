return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local filetypes = require("config.parsers.list")

		require("nvim-treesitter").install(filetypes)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
