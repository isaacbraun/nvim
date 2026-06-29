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

vim.g.fff = {
  lazy_sync = true,
}

local download = require 'fff.download'
if not vim.uv.fs_stat(download.get_binary_path()) then download.download_or_build_binary() end

local ok, fff = pcall(require, 'fff')
if ok then
  fff.setup {
    prompt_vim_mode = true,
    keymaps = {
      focus_preview = "<leader>p"
    }
  }
else
  vim.notify('Failed to load fff.nvim: ' .. fff, vim.log.levels.ERROR)
end

vim.keymap.set('n', '<leader>sf', fff.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', fff.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set({ 'n', 'v' }, '<leader>sw', function() fff.live_grep { query = vim.fn.expand '<cword>' } end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', fff.live_grep, { desc = '[S]earch by [G]rep' })
