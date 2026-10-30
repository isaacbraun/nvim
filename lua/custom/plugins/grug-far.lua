vim.pack.add { 'https://github.com/MagicDuck/grug-far.nvim' }

vim.keymap.set('n', '<leader>sr', function() require('grug-far').open() end, { desc = '[S]earch [R]eplace' })

vim.keymap.set(
  { 'n', 'v' },
  '<leader>sw',
  function() require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } } end,
  { desc = '[S]earch current [W]ord' }
)

vim.keymap.set(
  { 'n', 'v' },
  '<leader>rb',
  function()
    require('grug-far').open { prefills = {
      search = vim.fn.expand '<cword>',
      paths = vim.fn.expand '%',
    } }
  end,
  { desc = '[R]eplace current word in [B]uffer' }
)

vim.keymap.set(
  { 'n', 'v' },
  '<leader>rw',
  function()
    require('grug-far').open { prefills = {
      search = vim.fn.expand '<cword>',
    } }
  end,
  { desc = '[R]eplace current word in [W]orkspace' }
)
