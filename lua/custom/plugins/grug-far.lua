vim.pack.add { 'https://github.com/MagicDuck/grug-far.nvim' }

vim.keymap.set('n', '<leader>sr', function() require('grug-far').open() end, { desc = '[S]earch [R]eplace' })

vim.keymap.set(
  { 'n', 'v' },
  '<leader>sw',
  function() require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } } end,
  { desc = '[S]earch current [W]ord' }
)

vim.keymap.set({ 'n', 'v' }, '<leader>rb', function()
  local path = vim.api.nvim_buf_get_name(0)
  if vim.bo.buftype ~= '' or path == '' or vim.fn.filereadable(path) ~= 1 then
    vim.notify('Buffer replacement requires a saved file buffer', vim.log.levels.WARN)
    return
  end

  require('grug-far').open {
    prefills = {
      search = vim.fn.expand '<cword>',
      flags = '--fixed-strings --word-regexp',
      paths = path:gsub(' ', '\\ '),
    },
  }
end, { desc = '[R]eplace current word in [B]uffer' })

vim.keymap.set(
  { 'n', 'v' },
  '<leader>rw',
  function()
    require('grug-far').open { prefills = {
      search = vim.fn.expand '<cword>',
      flags = '--fixed-strings --word-regexp',
    } }
  end,
  { desc = '[R]eplace current word in [W]orkspace' }
)
