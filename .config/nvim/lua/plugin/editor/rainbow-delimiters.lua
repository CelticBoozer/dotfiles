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
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f2594b" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#e9b143" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#f28534" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#8bba7f" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d3869b" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#80aa9e" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b0b846" })
	end,
}
