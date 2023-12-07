-- Fine-cmdline keymaps
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

-- Neo-tree keymaps
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>g', ':Neotree float git_status<CR>')