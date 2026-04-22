local M = {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true,
        selection_modes = {
          ['@function.outer'] = 'V', -- linewise for functions
          ['@parameter.outer'] = 'v', -- charwise for params
        },
        include_surrounding_whitespace = false,
      },
    }

    -- keymaps (set via vim.keymap.set, not the opts table)
    local select = require 'nvim-treesitter-textobjects.select'

    -- Functions & methods
    vim.keymap.set({ 'x', 'o' }, 'af', function()
      select.select_textobject('@function.outer', 'textobjects')
    end, { desc = '[A]round [F]unction' })
    vim.keymap.set({ 'x', 'o' }, 'if', function()
      select.select_textobject('@function.inner', 'textobjects')
    end, { desc = '[I]nside [F]unction' })

    -- Classes
    vim.keymap.set({ 'x', 'o' }, 'ac', function()
      select.select_textobject('@class.outer', 'textobjects')
    end, { desc = '[A]round [C]lass' })
    vim.keymap.set({ 'x', 'o' }, 'ic', function()
      select.select_textobject('@class.inner', 'textobjects')
    end, { desc = '[I]nside [C]lass' })

    -- Conditionals
    vim.keymap.set({ 'x', 'o' }, 'ai', function()
      select.select_textobject('@conditional.outer', 'textobjects')
    end, { desc = '[A]round [I]f/conditional' })
    vim.keymap.set({ 'x', 'o' }, 'ii', function()
      select.select_textobject('@conditional.inner', 'textobjects')
    end, { desc = '[I]nside [I]f/conditional' })

    -- Loops
    vim.keymap.set({ 'x', 'o' }, 'al', function()
      select.select_textobject('@loop.outer', 'textobjects')
    end, { desc = '[A]round [L]oop' })
    vim.keymap.set({ 'x', 'o' }, 'il', function()
      select.select_textobject('@loop.inner', 'textobjects')
    end, { desc = '[I]nside [L]oop' })

    -- Arguments/parameters
    vim.keymap.set({ 'x', 'o' }, 'aa', function()
      select.select_textobject('@parameter.outer', 'textobjects')
    end, { desc = '[A]round [A]rgument (includes comma)' })
    vim.keymap.set({ 'x', 'o' }, 'ia', function()
      select.select_textobject('@parameter.inner', 'textobjects')
    end, { desc = '[I]nside [A]rgument' })

    -- Return values
    vim.keymap.set({ 'x', 'o' }, 'ar', function()
      select.select_textobject('@return.outer', 'textobjects')
    end, { desc = '[A]round [R]eturn statement' })
    vim.keymap.set({ 'x', 'o' }, 'ir', function()
      select.select_textobject('@return.inner', 'textobjects')
    end, { desc = '[I]nside [R]eturn value' })

    -- Comments
    vim.keymap.set({ 'x', 'o' }, 'a/', function()
      select.select_textobject('@comment.outer', 'textobjects')
    end, { desc = '[A]round [/]comment' })
  end,
}

return M
