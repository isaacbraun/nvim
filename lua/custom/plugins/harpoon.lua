local function gh(repo) return 'https://github.com/' .. repo end

---@type (string|vim.pack.Spec)[]
local harpoon_plugins = {
  gh 'nvim-lua/plenary.nvim',
  { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
}

vim.pack.add(harpoon_plugins)

local harpoon = require 'harpoon'

harpoon:setup {
  settings = {
    save_on_toggle = true,
    excluded_filetypes = { 'harpoon' },
  },
}

vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[E]xplore Harpoons' })

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = '[A]dd item to Harpoon' })
vim.keymap.set('n', '<leader>j', function() harpoon:list():select(1) end, { desc = 'First Harpoon' })
vim.keymap.set('n', '<leader>k', function() harpoon:list():select(2) end, { desc = 'Second Harpoon' })
vim.keymap.set('n', '<leader>l', function() harpoon:list():select(3) end, { desc = 'Third Harpoon' })
vim.keymap.set('n', '<leader>;', function() harpoon:list():select(4) end, { desc = 'Fourth Harpoon' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end, { desc = '[P]revious Harpoon' })
vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end, { desc = '[N]ext Harpoon' })
