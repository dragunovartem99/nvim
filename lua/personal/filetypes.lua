vim.filetype.add({
	filename = {
		[".hbs"] = "glimmer",
		[".ejs"] = "embedded_template",
	},
	pattern = {
		["%.env%.?.*"] = "sh",
	},
})
