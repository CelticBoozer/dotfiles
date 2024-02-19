-- INFO: indentation guides
return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		indent = {
			char = "▏",
			smart_indent_cap = true,
		},
	},
	main = "ibl",
}
