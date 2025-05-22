vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("personal-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
