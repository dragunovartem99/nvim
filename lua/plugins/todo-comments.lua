return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({ signs = false })
		vim.keymap.set("n", "<leader>ft", vim.cmd.TodoTelescope, { desc = "[F]ind [T]odos" })
	end,
}
