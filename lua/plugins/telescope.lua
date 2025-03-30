return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")

		local map = function(keys, desc, method, opts)
			vim.keymap.set("n", "<leader>" .. keys, function()
				builtin[method](opts)
			end, { desc = "Telescope: " .. desc })
		end

		-- Unique

		map("fh", "[F]ind [H]elp", "help_tags")
		map("fg", "[F]ind [G]rep", "live_grep")
		map("fv", "[F]ind [V]CS", "git_files")
		map("fr", "[F]ind [R]esume", "resume")

		-- Basics

		map("ff", "[F]ind [F]iles", "find_files")
		map("fa", "[F]ind [A]ll", "find_files", { hidden = true, prompt_title = "Find Files (All)" })

		-- Ignored modifier

		map(
			"fi",
			"[F]ind [I]gnored",
			"find_files",
			{ no_ignore = true, no_ignore_parent = true, prompt_title = "Find Ignored Files" }
		)

		map("fia", "[F]ind [I]gnored [A]ll", "find_files", {
			hidden = true,
			no_ignore = true,
			no_ignore_parent = true,
			prompt_title = "Find Ignored Files (All)",
		})

		-- Neovim

		map(
			"fn",
			"[F]ind [N]eovim",
			"find_files",
			{ cwd = vim.fn.stdpath("config"), prompt_title = "Find Neovim Files" }
		)
	end,
}
