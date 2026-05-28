require('nvim-treesitter').install({ 'sql', 'markdown', 'markdown_inline' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'markdown' },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
