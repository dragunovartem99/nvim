vim.keymap.set("n", "<leader>x", function()
	local type = vim.bo.filetype
	local content = vim.fn.shellescape(vim.fn.expand("%"))

	local run = function(command)
		local output = vim.fn.system(command)
		print(output)
	end

	if type == "c" then
		local binary = vim.fn.shellescape(vim.fn.tempname())
		run("gcc " .. content .. " -o " .. binary .. " && " .. binary .. "; rm -f " .. binary)
	elseif type == "javascript" then
		run("node " .. content)
	elseif type == "typescript" then
		run(
			"node "
				.. "--experimental-transform-types "
				.. "--disable-warning=ExperimentalWarning "
				.. content
		)
	elseif type == "sh" then
		run("bash " .. content)
	elseif type == "python" then
		run("python3 " .. content)
	elseif type == "lua" then
		vim.cmd.luafile("%")
	else
		print("Cannot execute " .. type .. " file!")
	end
end, { desc = "E[x]ecute" })
