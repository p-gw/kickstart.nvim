return {
  'quarto-dev/quarto-nvim',
  dependencies = {
    'jmbuhr/otter.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('quarto').setup {
      config = {
        dev = false,
        opts = {
          diagnostics = {
            enabled = false,
          },
          lspFeatures = {
            enabled = true,
            chunks = 'curly',
          },
          codeRunner = {
            enabled = false,
          },
        },
      },
    }
  end,
}
