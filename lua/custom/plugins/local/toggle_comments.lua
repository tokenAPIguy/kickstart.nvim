return {
  'toggle_comments', -- Name for lazy.nvim
  dir = '~/.config/nvim/lua/custom/plugins/local', -- Empty string tells lazy.nvim it's in the plugins directory already
  -- dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins/local/commenttoggler',
  config = function()
    local function toggle_comment()
      local mode = vim.api.nvim_get_mode().mode
      if mode == 'v' or mode == 'V' or mode == '' then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
        vim.defer_fn(function()
          local start_line = vim.fn.line "'<"
          local end_line = vim.fn.line "'>"
          if not start_line or not end_line then
            return
          end

          local first_line = vim.api.nvim_buf_get_lines(0, start_line - 1, start_line, false)[1]
          if not first_line then
            return
          end

          local has_comment = string.match(first_line, '^%s*//')

          for line_num = start_line, end_line do
            local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
            if not line then
              goto continue
            end

            local new_line
            if has_comment then
              new_line = string.gsub(line, '^%s*//%s?', '')
            else
              new_line = '// ' .. line
            end
            vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
            ::continue::
          end
        end, 10)
      else
        local line = vim.api.nvim_get_current_line()
        local new_line
        if string.match(line, '^%s*//') then
          new_line = string.gsub(line, '^%s*//%s?', '')
        else
          new_line = '// ' .. line
        end
        vim.api.nvim_set_current_line(new_line)
      end
    end

    -- Create a user command
    vim.api.nvim_create_user_command('ToggleComment', toggle_comment, {})

    -- Set up keymaps
    vim.keymap.set({ 'n', 'v' }, '<leader>c/', toggle_comment, { noremap = true, silent = true, desc = 'ToggleComment' })
  end,
  lazy = false, -- Load immediately
  keys = {
    { '<leader>c/', desc = 'Toggle Comment' },
  },
}
