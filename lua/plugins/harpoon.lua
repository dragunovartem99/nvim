return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local ui = require("harpoon.ui")
		local mark = require("harpoon.mark")

		local map = function(keys, desc, callback)
			vim.keymap.set("n", "<leader>" .. keys, callback, { desc = "Harpoon: " .. desc })
		end

		map("hh", "[H]arpoon", ui.toggle_quick_menu)
		map("hm", "[H]arpoon [M]ark", mark.add_file)

		map("hp", "[H]arpoon [P]rev", ui.nav_prev)
		map("hn", "[H]arpoon [N]ext", ui.nav_next)

		local max_files = 4
		for file = 1, max_files, 1 do
			map("h" .. file, "[H]arpoon Open [" .. file .. "]", function()
				ui.nav_file(file)
			end)
		end
	end,
}
