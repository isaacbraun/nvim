local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add {
  gh 'rose-pine/neovim',
  gh 'catppuccin/nvim',
  gh 'ellisonleao/gruvbox.nvim',
}

-- require('catppuccin').setup {
--   background = {
--     light = 'latte',
--   },
--   transparent_background = true,
-- }

require('rose-pine').setup {
  variant = 'dawn',
  styles = {
    transparency = true,
  },
}

require('gruvbox').setup {
  contrast = 'hard',
  transparent_mode = true,
}

local function set_colorscheme()
  if vim.o.background == 'light' then
    vim.cmd.colorscheme 'rose-pine'
  else
    vim.cmd.colorscheme 'gruvbox'
  end
end

set_colorscheme()

vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = set_colorscheme,
})

-- vim: ts=2 sts=2 sw=2 et
