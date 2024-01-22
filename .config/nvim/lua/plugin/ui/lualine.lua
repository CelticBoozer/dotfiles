return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "gruvbox-material",
			globalstatus = true,
		},
		sections = {
			lualine_b = {
				"branch",
				{
					"diff",
					colored = true,
					symbols = { added = "+", modified = "~", removed = "-" },
					source = nil,
				},
				{
					"diagnostics",
					sources = {
						"nvim_diagnostic",
						"nvim_lsp",
					},
					sections = {
						"error",
						"warn",
						"info",
						"hint",
					},
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = " ",
					},
					colored = true,
					update_in_insert = true,
					always_visible = false,
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = false,
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = "[+]",
						readonly = "[RO]",
						unnamed = "[No Name]",
						newfile = "[New]",
					},
				},
			},
			lualine_x = {
				{
					"searchcount",
					maxcount = 999,
					timeout = 10,
				},
				"encoding",
				{
					"filetype",
					colored = true,
					icon_only = false,
					icon = { align = "left" },
				},
			},
		},
	},
}
