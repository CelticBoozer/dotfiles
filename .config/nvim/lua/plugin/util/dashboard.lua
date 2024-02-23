-- INFO: enter screen configuration
return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = {
					"",
					" ██████╗███████╗██╗  ████████╗██╗ ██████╗██╗   ██╗██╗███╗   ███╗",
					"██╔════╝██╔════╝██║  ╚══██╔══╝██║██╔════╝██║   ██║██║████╗ ████║",
					"██║     █████╗  ██║     ██║   ██║██║     ██║   ██║██║██╔████╔██║",
					"██║     ██╔══╝  ██║     ██║   ██║██║     ╚██╗ ██╔╝██║██║╚██╔╝██║",
					"╚██████╗███████╗███████╗██║   ██║╚██████╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
					" ╚═════╝╚══════╝╚══════╝╚═╝   ╚═╝ ╚═════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
				},
				shortcut = {
					{
						desc = " Files",
						group = "Orange",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Plugins",
						group = "Aqua",
						action = "Lazy update",
						key = "u",
					},
					{
						desc = " LSP",
						group = "Aqua",
						action = "Mason",
						key = "s",
					},
				},
				project = {
					icon = " ",
					label = " Recent project",
					limit = 8,
				},
				mru = {
					icon = " ",
					label = " Recent files",
					limit = 10,
				},
			},
		})
		vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = "#a9b665" })
		vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#d8a657" })
		vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { fg = "#d8a657" })
		vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = "#d8a657" })
		vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#d8a657" })
	end,
}
