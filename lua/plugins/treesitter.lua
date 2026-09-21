local parsers = require("config.parsers")

return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter").install(parsers)

		vim.filetype.add({
			extension = {
				["styl"] = "css",
				["hbs"] = "glimmer",
				["ejs"] = "embedded_template",
			},
			pattern = {
				["%.env%.?.*"] = "sh",
			},
		})

		-- Parser names differ from filetypes (e.g. bash -> sh, vimdoc -> help)
		local filetypes = {}
		for _, parser in ipairs(parsers) do
			vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(parser))
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("personal-treesitter", { clear = true }),
			pattern = filetypes,

			callback = function()
				-- Parser may still be installing on first launch
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
