vim.keymap.set("n", "<leader>x", function()
	local type = vim.bo.filetype
	local content = vim.fn.expand("%")

	local run = function(command)
		local output = vim.fn.system(command)
		print(output)
	end

	if type == "c" then
		run("gcc " .. content .. " -o /tmp/x && /tmp/x && rm /tmp/x")
	elseif type == "javascript" then
		run("node " .. content)
	elseif type == "typescript" then
		run("node --disable-warning=ExperimentalWarning --experimental-strip-types " .. content)
	elseif type == "sh" then
		run("bash " .. content)
	elseif type == "lua" then
		vim.cmd("luafile " .. content)
	else
		print("Cannot execute " .. type .. " file!")
	end
end, { desc = "E[x]ecute" })
