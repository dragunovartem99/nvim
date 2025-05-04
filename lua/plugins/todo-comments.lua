return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
	keys = {
		{
			"<leader>ft",
			vim.cmd.TodoTelescope,
			desc = "Telescope: [F]ind [T]odos",
		},
	},
}
