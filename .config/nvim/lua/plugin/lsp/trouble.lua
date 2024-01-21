return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		action_keys = {
			open_split = { "<c-s>" }, -- open buffer in new split
			open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
			open_tab = { "<c-t>" },
		},
		win_config = { border = "rounded" },
	},
	keys = {
		{ "<leader>d", ":Trouble<CR>", desc = "trouble diagnostics" },
	},
}
