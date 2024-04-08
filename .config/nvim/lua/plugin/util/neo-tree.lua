-- INFO: pretty file manager
return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim", -- Async support
		"nvim-tree/nvim-web-devicons", -- Just pretty icons
		"MunifTanjim/nui.nvim", -- Floating support
		"3rd/image.nvim", -- Image preview
	},
	keys = {
		{ "<leader>E", ":Neotree float reveal<CR>", desc = "float file explorer" },
		{ "<leader>e", ":Neotree left reveal<CR>", desc = "left file explorer" },
		{ "<leader>g", ":Neotree float git_status<CR>", desc = "float git status" },
	},
	opts = {
		close_if_last_window = false,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		open_files_do_not_replace_types = {
			"terminal",
			"trouble",
			"qf",
		},
		sort_case_insensitive = true,
		sort_function = nil,
		source_selector = {
			winbar = true,
			statusline = false,
		},
		default_component_configs = {
			git_status = {
				symbols = {
					-- Change type
					added = "",
					modified = "",
					deleted = "",
					renamed = "",

					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},
		filesystem = {
			filtered_items = {
				always_show = {
					".gitignore",
					".gitmodules",
				},
			},
		},
	},
}
