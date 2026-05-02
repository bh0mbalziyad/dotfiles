local M = {
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-completion',
  'kristijanhusak/vim-dadbod-ui',
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      vim.keymap.set('n', '<leader>dbu', '<cmd>DBUIToggle<CR>', { desc = '[DBUI] [T]oggle' })
    end,
  },
}

return M
