-- INFO: cool finder|previewer
return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim", -- Async support
		"nvim-lua/popup.nvim", -- Popup support
		"debugloop/telescope-undo.nvim", -- Custom module, to preview undos
		"nvim-telescope/telescope-media-files.nvim", -- Custom module, to preview images
		"lpoto/telescope-docker.nvim", --  Custom module, docker support
	},
	keys = {
		{ "<leader>ff", ":Telescope find_files<CR>", desc = "find files" },
		{ "<leader>fg", ":Telescope live_grep<CR>", desc = "grep files" },
		{ "<leader>fm", ":Telescope media_files<CR>", desc = "find media" },
		{ "<leader>fd", ":Telescope docker<CR>", desc = "navigate docker" },
		{ "<leader>fu", ":Telescope undo<CR>", desc = "navigate undos" },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-h>"] = "which_key",
					["<C-s>"] = "select_vertical",
					["<C-x>"] = "select_horizontal",
				},
				n = {
					["s"] = "select_vertical",
					["S"] = "select_horizontal",
					["t"] = "select_tab",
				},
			},
		},
		extensions = {
			media_files = {
				filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
				find_cmd = "rg",
			},
			docker = {},
			undo = {},
		},
	},
}
