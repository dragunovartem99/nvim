return {
	-- linux
	["clang-format"] = require("config.formatters.clang-format"),
	["shfmt"] = require("config.formatters.shfmt"),
	["shellcheck"] = {},

	-- web
	["prettier"] = require("config.formatters.web"),
	["oxfmt"] = require("config.formatters.web"),
}
