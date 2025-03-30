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

		vim.keymap.set("n", "<leader>hf", function() ui.nav_file(1) end)
		vim.keymap.set("n", "<leader>hd", function() ui.nav_file(2) end)
		vim.keymap.set("n", "<leader>hs", function() ui.nav_file(3) end)
		vim.keymap.set("n", "<leader>ha", function() ui.nav_file(4) end)
	end,
}
