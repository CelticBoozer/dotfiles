-- INFO: colorize bracket, tags and other delimiters
return {
	"hiphish/rainbow-delimiters.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowOrange",
				"RainbowCyan",
				"RainbowViolet",
				"RainbowGreen",
				"RainbowBlue",
			},
		})
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#d8a657" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89b482" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d3869b" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7daea3" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a9b665" })
	end,
}
