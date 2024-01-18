return {
	"mhartington/formatter.nvim",
	config = function()
		local opts = {
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		}
		require("formatter").setup(opts)
	end,
	keys = {
		{ "<leader>lf", ":Format<CR>", desc = "format file" },
	},
}
