vim.pack.add { 'https://github.com/github/copilot.vim' }

vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true

local function map(l, r, opts)
  opts = vim.tbl_extend('error', { silent = true }, opts or {})
  vim.keymap.set('i', l, r, opts)
end

map('<C-f>', 'copilot#Accept("\\<CR>")', { desc = '[F]ill Copilot suggestion', expr = true, replace_keycodes = false })
map('<C-j>', '<Plug>(copilot-next)', { desc = 'Next Copilot suggestion' })
map('<C-k>', '<Plug>(copilot-previous)', { desc = 'Previous Copilot suggestion' })
map('<C-l>', '<Plug>(copilot-suggest)', { desc = '[L]ist Copilot suggestions' })
map('<C-d>', '<Plug>(copilot-dismiss)', { desc = '[D]ismiss Copilot suggestion' })
