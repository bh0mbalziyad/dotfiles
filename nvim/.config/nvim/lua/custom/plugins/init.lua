-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local ufo = require 'custom.plugins.ufo'
local vimTmuxNavigator = require 'custom.plugins.vim-tmux-navigator'
local bufferline = require 'custom.plugins.bufferline'

return {
  ufo,
  vimTmuxNavigator,
  bufferline,
}
