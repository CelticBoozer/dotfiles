-- INFO: my gruvbox theme
return {
	"sainnhe/gruvbox-material",
	lazy = false,
	config = function()
		local g = vim.g

		g.gruvbox_material_background = "soft"
		g.gruvbox_material_foreground = "material"
		g.gruvbox_material_transparent_background = 2
		g.gruvbox_material_sign_column_background = "grey"
		g.gruvbox_material_statusline_style = "default"
		g.gruvbox_material_ui_contrast = "low"
		g.gruvbox_material_diagnostic_line_highlight = "1"
		g.gruvbox_material_disable_terminal_colors = 1

		-- Font settings
		g.gruvbox_material_enable_bold = 1
		g.gruvbox_material_enable_italic = 1

		g.gruvbox_material_better_performance = 1

		vim.cmd([[colorscheme gruvbox-material]])

		vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#d4be98" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#d4be98" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = "#d4be98" })
	end,
	priority = 1000,
}
