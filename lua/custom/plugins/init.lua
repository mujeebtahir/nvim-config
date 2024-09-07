-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- TODO: Plugins to try
  -- * timewarrior: https://www.reddit.com/r/neovim/comments/1awiy1t/neovim_timetracking_system_using_timewarrior/
  -- * obsidian: https://www.reddit.com/r/neovim/comments/1awiy1t/neovim_timetracking_system_using_timewarrior/
  -- * Journaling?
  -- * Org-mode from emacs?
  -- * Neovide (sick animations, a gui for neovim) https://neovide.dev/
  -- * barbar.vim for buffer tabs
  --
  -- TODO: Fix things
  -- * Fix opts related to tab and spaces. Tab should be 8 not 4.
  --
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'powerman/vim-plugin-AnsiEsc', -- he AnsiEsc.vim file, when sourced, will conceal Ansi escape sequences but will cause subsequent text to be colored as the escape sequence specifies.

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    opts = {
      width = 127,
    },
  },

  -- -- Here is a more advanced example where we pass configuration
  -- -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  -- --    require('gitsigns').setup({ ... })
  -- --
  -- -- See `:help gitsigns` to understand what the configuration keys do
  -- { -- Adds git related signs to the gutter, as well as utilities for managing changes
  --   'lewis6991/gitsigns.nvim',
  --   opts = {
  --     signs = {
  --       add = { text = '+' },
  --       change = { text = '~' },
  --       delete = { text = '_' },
  --       topdelete = { text = '‾' },
  --       changedelete = { text = '~' },
  --     },
  --   },
  -- },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end
  { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  -- {
  --   'mg979/vim-visual-multi',
  --   branch = 'master',
  --   init = function()
  --     vim.g.VM_maps = {
  --       ['Find Under'] = '<C-n>',
  --     }
  --   end,
  -- },
}
