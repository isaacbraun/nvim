vim.pack.add { 'https://github.com/tpope/vim-fugitive' }

vim.keymap.set('n', '<leader>gs', '<cmd>vertical Git | vertical resize 60<cr>', { desc = '[G]it [S]tatus' })
