local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local lualine = require 'lualine'

    lualine.setup {
      theme = 'nightfly',
    }
  end,
}

return M
