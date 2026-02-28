return {
	handlers = {
		["textDocument/publishDiagnostics"] = function(err, res, ...)
			local filename = vim.fs.basename(vim.uri_to_fname(res.uri))

			if not vim.startswith(filename, ".env") then
				return vim.lsp.diagnostic.on_publish_diagnostics(err, res, ...)
			end
		end,
	},
}
