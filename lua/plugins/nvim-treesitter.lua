require('nvim-treesitter').install({ 'sql' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql' },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
