local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'tpope/vim-obsession',
    'folke/noice.nvim',
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
          {
            require('noice').api.status.mode.get,
            cond = require('noice').api.status.mode.has,
            color = { fg = '#ff9e64' },
          },
          'fileformat',
          'filetype',
          obsession_status,
        },
      },
    }
  end,
}

return M
