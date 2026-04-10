-- local M = {
--   'projekt0n/github-nvim-theme',
--   name = 'github-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup {
--       -- ...
--     }
--
--     vim.cmd 'colorscheme github_dark_high_contrast'
--   end,
-- }

-- local M = {
--   'rebelot/kanagawa.nvim',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('kanagawa').setup()
--     vim.cmd 'colorscheme kanagawa'
--   end,
-- }

local M = {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require('tokyonight').setup()
    vim.cmd 'colorscheme tokyonight-night'
  end,
}

return M
