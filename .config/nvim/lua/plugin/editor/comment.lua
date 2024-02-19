-- INFO: comment/uncomment strings
return {
	"numToStr/Comment.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- For calculating commentstring
		"JoosepAlviste/nvim-ts-context-commentstring", -- Context commenting for example, Vue have many different sections
	},
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
