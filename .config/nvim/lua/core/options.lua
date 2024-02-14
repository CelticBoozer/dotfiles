local o = vim.opt

-- Set lines enable
o.number = true
o.relativenumber = true

-- Tabs settings
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Save changes automatically
o.autowriteall = true

-- Enable cursor higlighting
o.cursorline = true

-- Search ingroing case
o.ignorecase = true

-- Split rules
o.splitright = true
o.splitbelow = true

-- Some backup and undo rules to keep
o.undofile = true
o.undodir = vim.fn.expand("~/.nvim/undo/")
o.directory = vim.fn.expand("~/.nvim/swp/")
o.backupdir = vim.fn.expand("~/.nvim/backup/")

-- Line wrapping
o.wrap = true
o.linebreak = true

-- Set system clipboard
o.clipboard:append("unnamedplus")

-- Enable mouse input
o.mousemoveevent = true

-- Basic color setup
o.termguicolors = true
o.background = "dark"

-- UFO folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
