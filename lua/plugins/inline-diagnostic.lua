return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "nonerdfont",
			options = { multilines = { enabled = true } },
		})
	end,
}
