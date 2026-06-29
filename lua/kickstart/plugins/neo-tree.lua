-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>', { desc = '[E]xplore file tree', silent = true })

require('neo-tree').setup {
  event_handlers = {
    {
      event = 'file_opened',
      handler = function() require('neo-tree.command').execute { action = 'close' } end,
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        '.DS_Store',
        'thumbs.db',
      },
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
    window = {
      mappings = {
        ['<leader>e'] = 'close_window',
      },
      width = 25,
    },
  },
}
