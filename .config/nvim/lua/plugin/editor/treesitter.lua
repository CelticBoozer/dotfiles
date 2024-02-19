-- INFO: better highlighting, creating file tree
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
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
			"java",
			"groovy",
			"sql",
		},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
		build = ":TSUpdate",
	},
}
