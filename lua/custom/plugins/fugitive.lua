return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', function()
      vim.cmd 'topleft Git'
    end, { desc = '[G]it [S]atus' })
  end,
}
