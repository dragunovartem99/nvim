return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown() } },
		})

		pcall(telescope.load_extension, "ui-select")

		local map = function(keys, desc, method_name, opts)
			vim.keymap.set("n", "<leader>" .. keys, function()
				builtin[method_name](opts)
			end, { desc = "Telescope: " .. desc })
		end

		-- "Everyday" Search

		map("ff", "[F]ind [F]iles", "find_files")
		map("fg", "[F]ind [G]rep", "live_grep")

		-- Hidden Search

		map("fhg", "[F]ind [H]idden [G]rep", "live_grep", {
			additional_args = { "--hidden", "--no-ignore" },
			prompt_title = "Live (Hidden) Grep",
		})

		map("fhf", "[F]ind [H]idden [F]iles", "find_files", {
			hidden = true,
			no_ignore = true,
			no_ignore_parent = true,
			prompt_title = "Find (Hidden) Files",
		})

		-- Time Travelling

		map("fo", "[F]ind [O]ld Files", "oldfiles")
		map("fr", "[F]ind [R]esume", "resume")

		-- Development

		map("fd", "[F]ind [D]iagnostics", "diagnostics")
		map("fv", "[F]ind [V]CS", "git_files")

		-- Info

		map("ft", "[F]ind Help [T]ags", "help_tags")
		map("fk", "[F]ind [K]eymaps", "keymaps")
		map(
			"fn",
			"[F]ind [N]eovim",
			"find_files",
			{ cwd = vim.fn.stdpath("config"), prompt_title = "Find Neovim Files" }
		)
	end,
}
