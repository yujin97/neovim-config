return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', function()
      vim.cmd 'topleft Git'
    end, { desc = '[G]it [S]atus' })
    vim.keymap.set('n', '<leader>gc', function()
      vim.cmd 'topleft Git commit'
    end, { desc = '[G]it [C]ommit' })
  end,
}
