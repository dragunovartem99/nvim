return {
	"saghen/blink.cmp",
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p: Select next/previous item
		-- C-e: Hide menu
		keymap = { preset = "default" },
		appearance = { nerd_font_variant = "mono" },
		fuzzy = { implementation = "lua" },

		-- C-k: Toggle signature help (if signature.enabled = true)
		signature = { enabled = true },
	},
}
