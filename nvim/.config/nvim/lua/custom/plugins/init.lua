-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local ufo = require 'custom.plugins.ufo'
local bufferline = require 'custom.plugins.bufferline'
local lualine = require 'custom.plugins.lualine'

return {
  ufo,
  lualine,
  bufferline,
}
