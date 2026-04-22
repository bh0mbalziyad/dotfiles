local M = {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>tu', '<cmd>:UndotreeToggle<CR>', { desc = '[T]ogglec [U]ndotree' })
  end,
}

return M
