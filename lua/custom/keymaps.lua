local map = vim.keymap.set

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

-- Add fold
vim.api.nvim_set_keymap('n', '<leader>cz', [[/[{[(]<CR>zfaBzc]], { noremap = true, silent = true, desc = 'Add fold at next {, (, or [' })

-- Open Mini Terminal
vim.keymap.set('n', '<leader>tm', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.cmd 'startinsert'
  vim.api.nvim_win_set_height(0, 10)
end, { desc = '[T]erminal [M]ini' })

-- Open Lazygit Terminal
vim.keymap.set('n', '<leader>tlg', function()
  vim.cmd.vnew()
  vim.cmd 'terminal lazygit'
  vim.cmd 'startinsert'
end, { desc = '[T]erminal [L]azy[g]it' })

-- Open cht.sh/go
vim.keymap.set('n', '<leader>tcg', function()
  -- Prompt the user for input
  vim.ui.input({ prompt = 'cht.sh query (e.g., go/reverse string): ' }, function(input)
    if input and input ~= '' then
      -- Escape input for curl (e.g., spaces)
      local query = input:gsub(' ', '+')

      -- Open vertical split and run curl command
      vim.cmd.vnew()
      vim.cmd('terminal curl cht.sh/go/' .. query .. '; exec $SHELL')
      vim.cmd 'startinsert'
    end
  end)
end, { desc = '[T]erminal [C]ht.sh/[G]o' })

-- Open cht.sh/go
vim.keymap.set('n', '<leader>tcv', function()
  -- Prompt the user for input
  vim.cmd.vnew()
  vim.cmd 'terminal curl cht.sh/vim; exec $SHELL'
  vim.cmd 'startinsert'
end, { desc = '[T]erminal [C]ht.sh/[V]im' })

-- Oil in float
vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
