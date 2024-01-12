-- Fine-cmd-line
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

-- Neo-tree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>g', ':Neotree float git_status<CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fm', ':Telescope media_files<CR>')
