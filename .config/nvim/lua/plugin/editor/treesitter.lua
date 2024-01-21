return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"markdown_inline",
			"dockerfile",
			"bash",
			"json",
			"yaml",
			"toml",
			"html",
			"css",
			"javascript",
			"typescript",
		},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
		build = ":TSUpdate",
	},
}
