return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Show inline diagnostic
		vim.diagnostic.config({ virtual_text = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map(
					"gD",
					require("telescope.builtin").lsp_type_definitions,
					"[G]oto Type [D]efinition"
				)
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map(
					"gI",
					require("telescope.builtin").lsp_implementations,
					"[G]oto [I]mplementation"
				)

				map("<leader>r", vim.lsp.buf.rename, "[R]ename")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				map(
					"<leader>ds",
					require("telescope.builtin").lsp_document_symbols,
					"[D]ocument [S]ymbols"
				)
				map(
					"<leader>ws",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					"[W]orkspace [S]ymbols"
				)
			end,
		})
	end,
}
