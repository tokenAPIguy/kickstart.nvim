return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
    end,
  },
  {
    'vague2k/vague.nvim',
    priority = 1000,
    config = function()
      require('vague').setup {
        comments = 'italic',
        transparent = false,
        style = {
          style = {},
        },
      }
      --vim.cmd.colorscheme 'vague'
    end,
  },
  {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        transparent = true,
        style = {
          style = {},
        },
      }
      --vim.cmd 'colorscheme rose-pine'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        --transparent = true,
      }
      vim.cmd 'colorscheme kanagawa-paper-ink'
    end,
  },
  {
    'thesimonho/kanagawa-paper.nvim',
    priority = 1000,
    config = function()
      require('kanagawa-paper').setup {
        --transparent = true,
      }
      --vim.cmd 'colorscheme kanagawa-paper-ink'
    end,
  },
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require('catppuccin').setup {}
      --vim.cmd 'colorscheme catppuccin'
    end,
  },
  {
    'ramojus/mellifluous.nvim',
    config = function()
      require('mellifluous').setup {}
      --vim.cmd 'colorscheme mellifluous'
    end,
  },
}
