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
		vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = "#b0b846" })
		vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#e9b143" })
		vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { fg = "#e9b143" })
		vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = "#e9b143" })
		vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#e9b143" })
	end,
}
