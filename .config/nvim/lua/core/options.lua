local o = vim.opt

-- Set lines enable
o.number = true

-- Tabs settings
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Save changes automatically
o.autowriteall = true

-- Enable words spell check
o.spell = true

-- Enable cursor higlighting
o.cursorline = true

-- Search ingroing case
o.ignorecase = true

-- Split rules
o.splitright = true
o.splitbelow = true

-- Some backup and undo rules to keep
o.undofile = true
o.undodir = vim.fn.expand('~/.nvim/undo/')
o.directory = vim.fn.expand('~/.nvim/swp/')
o.backupdir = vim.fn.expand('~/.nvim/backup/')

-- Line wrapping
o.wrap = true
o.linebreak = true

-- Hide default cmdline, to make pretty and work with fine-cmdline
-- o.cmdheight = 0

-- Set system clipboard
o.clipboard:append('unnamedplus')
