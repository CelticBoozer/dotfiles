-- INFO: colorize and use icons for TODO comments
return {
	"folke/todo-comments.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		colors = {
			error = { "#ea6962" },
			warning = { "#d8a657" },
			info = { "#7daea3" },
			hint = { "#89b482" },
			default = { "#e78a4e" },
			test = { "#d3869b" },
		},
	},
}
