return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local map = function(keys, desc, callback)
			vim.keymap.set("n", "<leader>" .. keys, callback, { desc = "Harpoon: " .. desc })
		end

		map("hh", "[H]arpoon", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		map("hm", "[H]arpoon [M]ark", function()
			harpoon:list():add()
		end)

		map("hp", "[H]arpoon [P]rev", function()
			harpoon:list():prev()
		end)
		map("hn", "[H]arpoon [N]ext", function()
			harpoon:list():next()
		end)

		local max_files = 4
		for file = 1, max_files, 1 do
			map("h" .. file, "[H]arpoon Open [" .. file .. "]", function()
				harpoon:list():select(file)
			end)
		end
	end,
}
