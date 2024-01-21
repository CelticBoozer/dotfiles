return {
	"hiphish/rainbow-delimiters.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local rainbow = require("rainbow-delimiters")

		strategy = {
			[""] = rainbow.strategy["global"],
		}
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
		}
	end,
}
