return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Show inline diagnostic
		vim.diagnostic.config({ virtual_text = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
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

				map("td", "lsp_definitions", "[T]o [D]efinitions")
				map("tt", "lsp_type_definitions", "[T]o [T]ypes")
				map("tr", "lsp_references", "[T]o [R]eferences")
				map("ti", "lsp_implementations", "[T]o [I]mplementations")
				map("<leader>sd", "lsp_document_symbols", "[S]ymbols in [D]ocument")
				map("<leader>sw", "lsp_dynamic_workspace_symbols", "[S]ymbols in [W]orkspace")
			end,
		})
	end,
}
