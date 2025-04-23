local M = {
  'windwp/nvim-ts-autotag',
  config = function()
    local autotag = require 'nvim-ts-autotag'

    autotag.setup {}
  end,
}

return M
