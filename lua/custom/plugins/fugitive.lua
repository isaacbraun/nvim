vim.g.github_enterprise_urls = { 'https://devtopia.esri.com' }

vim.pack.add {
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/tpope/vim-rhubarb',
}

vim.api.nvim_create_user_command('Browse', function(opts) vim.fn.system { 'open', opts.fargs[1] } end, { nargs = 1 })

vim.keymap.set('n', '<leader>gs', '<cmd>vertical Git | vertical resize 60<cr>', { desc = '[G]it [S]tatus' })
