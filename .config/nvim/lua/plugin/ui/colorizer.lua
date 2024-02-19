-- INFO: higlight colors in editor
return {
	"norcalli/nvim-colorizer.lua",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		"*",
		css = {
			RRGGBBAA = true,
			css = true,
		},
	},
}
