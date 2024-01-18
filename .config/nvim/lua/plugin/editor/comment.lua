return {
	"numToStr/Comment.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	opts = {
		extra = {
			above = "gco",
			below = "gcO",
			eol = "gca",
		},
	},
}
