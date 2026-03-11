return {
  vim.filetype.add {
    pattern = {
      ['.sqruff'] = 'toml',
      ['.sqlfluff'] = 'toml',
    },
  },
}
