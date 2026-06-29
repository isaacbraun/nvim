local function gh(repo) return 'https://github.com/' .. repo end

---@type (string|vim.pack.Spec)[]
local neotest_plugins = {
  gh 'nvim-neotest/neotest',
  gh 'nvim-neotest/nvim-nio',
  gh 'nvim-lua/plenary.nvim',
  gh 'antoinemadec/FixCursorHold.nvim',
  gh 'nvim-treesitter/nvim-treesitter',
  gh 'marilari88/neotest-vitest',
}

vim.pack.add(neotest_plugins)

local lib = require 'neotest.lib'
local original_nearest = lib.positions.nearest

lib.positions.nearest = function(tree, line)
  local ok, nearest = pcall(original_nearest, tree, line)

  if ok then return nearest end

  return tree
end

local config = vim.tbl_extend('error', require 'neotest.config', {
  adapters = {
    require 'neotest-vitest',
  },
})

local neotest = require 'neotest'
neotest.setup(config)

vim.keymap.set('n', '<leader>nt', function() neotest.summary.toggle() end, { desc = 'Toggle [N]eo[T]est summary window' })
vim.keymap.set('n', '<leader>nr', function() neotest.run.run() end, { desc = '[N]eotest [R]un nearest test' })
vim.keymap.set('n', '<leader>nf', function() neotest.run.run(vim.fn.expand '%') end, { desc = '[N]eotest run [F]ile' })
vim.keymap.set('n', '<leader>no', function() neotest.output_panel.toggle() end, { desc = 'Toggle [N]eotest [O]utput panel' })
vim.keymap.set('n', '<leader>ns', function() neotest.run.stop() end, { desc = '[N]eotest [S]top' })
