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
		{ "<leader>td", ":Trouble document_diagnostics<CR>", desc = "trouble diagnostics workspace" },
		{ "<leader>tD", ":Trouble workspace_diagnostics<CR>", desc = "trouble diagnostics workspace" },
		{ "<leader>tl", ":Trouble loclist<CR>", desc = "trouble diagnostics workspace" },
		{ "<leader>tr", ":Trouble lsp_references<CR>", desc = "trouble diagnostics workspace" },
		{ "<leader>tR", ":Trouble lsp_definitions<CR>", desc = "trouble diagnostics workspace" },
	},
}
