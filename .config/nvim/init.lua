-- lazy.nvim package manager installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--Core
require("core.options")

local opts = {
	defaults = {
		lazy = false,
		version = "*",
		cond = nil,
	},
	dev = {
		path = "~/Development/Projects",
	},
	install = {
		missing = true,
		colorscheme = { "gruvbox-materal" },
	},
	ui = {
		border = "rounded",
	},
	checker = {
		enabled = true,
	},
}
local plugins = {
	{ import = "plugin.editor" },
	{ import = "plugin.lsp" },
	{ import = "plugin.ui" },
	{ import = "plugin.util" },
}

require("lazy").setup(plugins, opts)
require("telescope").load_extension("media_files")
