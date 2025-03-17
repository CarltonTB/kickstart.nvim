-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- For vim-like navigation between tmux panes and neovim
  { 'christoomey/vim-tmux-navigator', lazy = false },
  {
    -- For autoclosing HTML tags
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
  -- For autoclosing quote and bracket pairs
  -- { 'm4xshen/autoclose.nvim', opts = {} },
  -- Githup copilot
  { 'github/copilot.vim' },
  -- For showing git blame messages
  {
    'f-person/git-blame.nvim',
    lazy = false,
    config = function()
      -- Hide git blame messages on startup
      vim.cmd 'GitBlameToggle'
    end,
    keys = {
      { '<leader>gb', ':GitBlameToggle<CR>', desc = 'Toggle Git Blame' },
      { '<leader>gbf', ':GitBlameOpenFileURL<CR>', desc = 'Open File URL' },
      { '<leader>gbc', ':GitBlameOpenCommitURL<CR>', desc = 'Open Commit URL' },
    },
    opts = {
      virtual_text_column = 1,
    },
  },
  -- For file exploration and editing
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
