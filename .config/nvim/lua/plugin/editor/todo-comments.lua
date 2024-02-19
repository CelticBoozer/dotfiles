-- INFO: colorize and use icons for TODO comments
return {
	"folke/todo-comments.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		colors = {
			error = { "#f2594b" },
			warning = { "#e9b143" },
			info = { "#80aa9e" },
			hint = { "#8bba7f" },
			default = { "#f28534" },
			test = { "#d3869b" },
		},
	},
}
