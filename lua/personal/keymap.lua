vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>q", vim.cmd.Ex, { desc = "[Q]uit" })

-- compile and execute current .c program
vim.keymap.set(
	"n",
	"gcx",
	"<cmd>!cd %:h && gcc %:t -o %:t:r && ./%:t:r && rm %:t:r<CR>",
	{ desc = "[G]CC [C] [E]xecution" }
)
