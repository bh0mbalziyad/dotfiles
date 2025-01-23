local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local lualine = require 'lualine'

    lualine.setup {
      theme = 'nightfly',
      sections = {
        lualine_c = {
          {

            'filename',
            path = 1,
          },
        },
        lualine_x = {
          'fileformat',
          'filetype',
        },
      },
    }
  end,
}

return M
