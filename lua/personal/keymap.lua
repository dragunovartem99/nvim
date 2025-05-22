vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>q", vim.cmd.Ex, { desc = "[Q]uit" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("personal-lsp-attach", { clear = true }),
	callback = function(event)
		local builtin = require("telescope.builtin")
		local map = function(keys, method_name, desc, mode)
			mode = mode or "n"
			vim.keymap.set(
				mode,
				keys,
				builtin[method_name],
				{ buffer = event.buf, desc = "LSP: " .. desc }
			)
		end

		map("grd", "lsp_definitions", "[G]oto [D]efinitions")
		map("grt", "lsp_type_definitions", "[G]oto [T]ypes")
		map("grr", "lsp_references", "[G]oto [R]eferences")
		map("gri", "lsp_implementations", "[G]oto [I]mplementations")
		map("<leader>sd", "lsp_document_symbols", "[S]ymbols in [D]ocument")
		map("<leader>sw", "lsp_dynamic_workspace_symbols", "[S]ymbols in [W]orkspace")
	end,
})
