return {
  'floaterminal', -- Just a name to identify it in lazy.nvim

  dir = '~/.config/nvim/lua/custom/plugins', -- Empty string tells lazy.nvim it's in the plugins directory already

  config = function()
    vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')

    local state = {
      floating = {
        buf = -1,
        win = -1,
      },
    }

    local function create_floating_window(opts)
      opts = opts or {}
      local width = opts.width or math.floor(vim.o.columns * 0.8)
      local height = opts.height or math.floor(vim.o.lines * 0.8)
      -- Calculate the position to center the window
      local col = math.floor((vim.o.columns - width) / 2)
      local row = math.floor((vim.o.lines - height) / 2)
      -- Create a buffer
      local buf = nil
      if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
      else
        buf = vim.api.nvim_create_buf(false, true)
      end
      -- Define window config
      local win_config = {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded',
      }
      local win = vim.api.nvim_open_win(buf, true, win_config)
      return { buf = buf, win = win }
    end

    local toggle_terminal = function()
      if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= 'terminal' then
          vim.cmd.term()
        end
      else
        vim.api.nvim_win_hide(state.floating.win)
      end
      vim.cmd 'normal i'
    end

    vim.api.nvim_create_user_command('Floaterminal', toggle_terminal, {})
    vim.keymap.set({ 'n', 't' }, '<leader>tf', toggle_terminal, { desc = '[T]erminal [F]loating' })
  end,

  -- Optional but helpful for lazy.nvim
  lazy = false, -- Set to true if you want it to load lazily
  keys = {
    { '<leader>tf', desc = '[T]erminal [F]loating' },
  },
}
