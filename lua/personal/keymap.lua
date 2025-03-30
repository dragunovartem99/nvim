vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<leader>q", vim.cmd.Ex, { desc = "[Q]uit" })

vim.keymap.set("n", "<leader>wc", function() vim.cmd("cd %:p:h") end, { desc = "[W]orkspace [C]hange" })
