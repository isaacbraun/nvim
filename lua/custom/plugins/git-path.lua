vim.api.nvim_create_user_command('GitPath', function()
  local file = vim.api.nvim_buf_get_name(0)

  if file == '' then
    print 'No file for current buffer'
    return
  end

  local dir = vim.fs.dirname(file)

  local result = vim
    .system({ 'git', '-C', dir, 'rev-parse', '--show-toplevel' }, {
      text = true,
    })
    :wait()

  if result.code ~= 0 then
    print 'Not inside a git repo'
    return
  end

  local git_root = vim.trim(result.stdout)
  local path = vim.fs.relpath(git_root, file)

  vim.fn.setreg('+', path)
  print(path)
end, {})
