-- Configuration for iron
-- a REPL for Neovim
return {
  'Vigemus/iron.nvim',
  config = function()
    require('iron.core').setup {
      config = {
        scratch_repl = true,
        repl_definition = {
          sh = { command = { 'nu' } },
          R = {
            command = { 'R' },
          },
          python = {
            command = { 'python' },
          },
          julia = {
            command = { 'julia' },
          },
        },
        repl_open_cmd = require('iron.view').bottom(20),
      },
      keymaps = {
        toggle_repl = '<leader>tr',
      },
    }

    local iron = require 'iron.core'

    vim.keymap.set('n', '<leader>rR', function() vim.cmd 'IronRestart' end, { desc = '[R]estart [R]EPL' })
    vim.keymap.set('n', '<leader>rt', function() vim.cmd 'IronRepl' end, { desc = '[T]oggle [R]EPL' })
    vim.keymap.set('n', '<leader>tr', function() vim.cmd 'IronRepl' end, { desc = '[T]oggle [R]EPL' })

    vim.keymap.set('n', '<leader>rsl', function() iron.send_line() end, { desc = '[S]end [L]ine to REPL' })
    vim.keymap.set('n', '<leader>rsc', function()
      vim.o.operatorfunc = "v:lua.require'iron.core'.send_motion"
      return 'g@'
    end, { expr = true, desc = '[S]end motion to REPL' })
    vim.keymap.set('v', '<leader>rsc', function() iron.visual_send() end, { desc = '[S]end selection to REPL' })
    vim.keymap.set('n', '<leader>rsu', function() iron.send_until_cursor() end, { desc = '[S]end [U]ntil cursor to REPL' })
    vim.keymap.set('n', '<leader>rsf', function() iron.send_file() end, { desc = '[S]end [F]ile to REPL' })
    vim.keymap.set('n', '<leader>rsp', function() iron.send_paragraph() end, { desc = '[S]end [P]aragraph to REPL' })
    vim.keymap.set('n', '<leader>rsm', function() iron.send_mark() end, { desc = '[S]end [M]ark to REPL' })
    vim.keymap.set('n', '<leader>rsb', function() iron.send_code_block(false) end, { desc = '[S]end Code [B]lock to REPL' })
    vim.keymap.set('n', '<leader>rsn', function() iron.send_code_block(true) end, { desc = '[S]end Code Block to REPL and move' })

    vim.keymap.set('n', '<leader>rmm', function()
      vim.o.operatorfunc = "v:lua.require'iron.core'.mark_motion"
      return 'g@'
    end, { expr = true, desc = '[M]ark [M]otion' })
    vim.keymap.set('v', '<leader>rmm', function() iron.mark_visual() end, { desc = '[M]ark selection' })
    vim.keymap.set('n', '<leader>rmd', function() require('iron.marks').drop_last() end, { desc = 'Remove [M]ark' })

    vim.keymap.set('n', '<leader>rq', function() iron.close_repl() end, { desc = 'Close REPL' })
  end,
}
