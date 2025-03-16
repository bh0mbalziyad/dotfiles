local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'tpope/vim-obsession',
  },
  config = function()
    local lualine = require 'lualine'

    local function obsession_status()
      local status = vim.fn.ObsessionStatus()

      if status == '[$]' then
        return '🔄'
      end
      return '⏸️'
    end

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
          obsession_status,
        },
      },
    }
  end,
}

return M
