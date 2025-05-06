-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  { import = 'custom.plugins.remote.smear_cursor' },
  { import = 'custom.plugins.remote.startup-nvim' },
  { import = 'custom.plugins.remote.oil-nvim' },

  { import = 'custom.plugins.local.floaterminal' },
  { import = 'custom.plugins.local.toggle_comments' },
}
