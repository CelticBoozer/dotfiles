return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	opts = {
		"*",
		css = {
			RRGGBBAA = true,
			css = true,
		},
	},
}
