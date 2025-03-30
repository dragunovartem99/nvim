return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local ui = require("harpoon.ui")
		local mark = require("harpoon.mark")

		vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "[H]arpoon" })

		vim.keymap.set("n", "<leader>hm", mark.add_file, { desc = "[H]arpoon [M]ark" })
		vim.keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "[H]arpoon [P]rev" })
		vim.keymap.set("n", "<leader>hn", ui.nav_prev, { desc = "[H]arpoon [N]ext" })

		vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
		vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
		vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
		vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
	end,
}
