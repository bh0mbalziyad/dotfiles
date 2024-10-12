local M = {
  'akinsho/bufferline.nvim',
  version = '4.7.0',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        separator_style = 'slope',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            return ''
          end
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        numbers = function(ordinal, id, lower, raise)
          return string.format('%d', ordinal)
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
      },
    }
  end,
}

return M
