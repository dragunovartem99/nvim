local filetypes = require("config.parsers")

return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter").install(filetypes)

		vim.filetype.add({
			extension = {
				hbs = "glimmer",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,

			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
