return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		local map = function(keys, desc, method, opts)
			vim.keymap.set("n", "<leader>" .. keys, function()
				builtin[method](opts)
			end, { desc = "Telescope: " .. desc })
		end

		map("fh", "[F]ind [H]elp", "help_tags")
		map("fk", "[F]ind [K]eymaps", "keymaps")

		-- Debug

		map("fd", "[F]ind [D]iagnostics", "diagnostics")

		-- "Everyday" Search

		map("ff", "[F]ind [F]iles", "find_files")
		map("fv", "[F]ind [V]CS", "git_files")
		map("fg", "[F]ind [G]rep", "live_grep")

		-- Time Travelling

		map("fo", "[F]ind [O]ld Files", "oldfiles")
		map("fr", "[F]ind [R]esume", "resume")

		-- Rare Cases

		map("fa", "[F]ind [A]ll", "find_files", {
			hidden = true,
			no_ignore = true,
			no_ignore_parent = true,
			prompt_title = "Find Files (All)",
		})

		map(
			"fn",
			"[F]ind [N]eovim",
			"find_files",
			{ cwd = vim.fn.stdpath("config"), prompt_title = "Find Neovim Files" }
		)
	end,
}
