return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { '<leader>tt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Toggle Trouble' },
    { '[t', '<cmd>Trouble next skip_groups=true jump=true<cr>', desc = 'Next Trouble Item' },
    { ']t', '<cmd>Trouble previous skip_groups=true jump=true<cr>', desc = 'Previous Trouble Item' },
  },
}
