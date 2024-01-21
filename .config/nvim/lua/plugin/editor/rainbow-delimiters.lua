return {
	"hiphish/rainbow-delimiters.nvim",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local rainbow = require("rainbow-delimiters")

		strategy = {
			[""] = rainbow.strategy["global"],
			vim = rainbow.strategy["local"],
		}
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
		}
	end,
}
