vim.pack.add { 'https://github.com/dmtrKovalenko/fff.nvim' }

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd 'fff.nvim' end
      require('fff.download').download_or_build_binary()
    end
  end,
})

-- Create an empty highlight group to counteract Catppuccin's CursorLine conflicting highlight group
vim.api.nvim_set_hl(0, 'FFFCursorLineNull', {})

vim.g.fff = {
  lazy_sync = true,
  prompt_vim_mode = true,
  keymaps = {
    focus_preview = '<leader>p',
  },
  layout = {
    border = 'rounded',
  },
  hl = {
    winhl = {
      preview = 'CursorLine:FFFCursorLineNull',
    },
  },
}

local fff = require 'fff'
vim.keymap.set('n', '<leader>sf', fff.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', fff.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set({ 'n', 'v' }, '<leader>sw', function() fff.live_grep { query = vim.fn.expand '<cword>' } end, { desc = '[S]earch current [W]ord' })
