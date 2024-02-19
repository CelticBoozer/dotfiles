-- INFO: pretty LSP diagnostics plugin
return {
	"folke/trouble.nvim",
	lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Just pretty icons
	keys = {
		{ "<leader>td", ":Trouble document_diagnostics<CR>", desc = "trouble diagnostics document" },
		{ "<leader>tD", ":Trouble workspace_diagnostics<CR>", desc = "trouble diagnostics workspace" },
		{ "<leader>tr", ":Trouble lsp_references<CR>", desc = "references" },
		{ "<leader>tR", ":Trouble lsp_definitions<CR>", desc = "definition" },
	},
	opts = {
		action_keys = {
			open_split = { "<c-s>" }, -- open buffer in new split
			open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
			open_tab = { "<c-t>" },
		},
		win_config = { border = "rounded" },
	},
}
