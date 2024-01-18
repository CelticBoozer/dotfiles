return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		options = {
			mode = "tabs",
			themable = true,
			numbers = "ordinal",
			right_mouse_command = false,
			indicator = {
				style = "underline",
			},
			buffer_close_icon = "",
			modified_icon = "",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = false,
			show_tab_indicators = false,
			show_duplicate_prefix = true,
			separator_style = "slope",
			enforce_regular_tabs = false,
			always_show_bufferline = false,
			hover = {
				enabled = true,
				delay = 100,
				reveal = { "close" },
			},
		},
		highlights = {
			separator = {
				fg = "#252423",
				bg = "#32302f",
			},
			separator_selected = {
				fg = "#252423",
				bg = "#32302f",
			},
			fill = {
				fg = "#252423",
				bg = "#252423",
			},
		},
	},
}
