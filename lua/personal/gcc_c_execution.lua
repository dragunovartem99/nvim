-- compile and execute current C program
vim.keymap.set("n", "gcx", function()
	if vim.bo.filetype == "c" then
		vim.cmd("!cd %:h && gcc %:t -o %:t:r && ./%:t:r && rm %:t:r")
	else
		print("Not a C file!")
	end
end, { desc = "[G]CC [C] E[x]ecution" })
