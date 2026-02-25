local M = {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd [[colorscheme tokyonight]]
  --   end,
  -- },
  {
    'erl-koenig/theme-hub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Optional: for themes that use lush (will be notified if a theme requires it)
      -- "rktjmp/lush.nvim"
    },
    config = function()
      require('theme-hub').setup {
        install_dir = vim.fn.stdpath 'data' .. '/theme-hub',
        auto_install_on_select = true,
        apply_after_install = true,
        persistent = true,
      }

      vim.keymap.set('n', '<leader>sth', '<cmd>ThemeHub<CR>', { desc = '[S]earch [T][h]emehub' })
    end,
  },
}

return M
