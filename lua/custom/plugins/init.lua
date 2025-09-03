-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- For vim-like navigation between tmux panes and neovim
  -- { 'christoomey/vim-tmux-navigator', lazy = false },
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
  -- { 'github/copilot.vim' },
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
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ['<C-x>'] = { 'actions.select', opts = { horizontal = true } },

          -- disable h and l keymaps because they are used for navigating between tmux windows
          ['<C-h>'] = false,
          ['<C-l>'] = false,

          ['<leader>r'] = 'actions.refresh',
        },
      }
      -- Make Ex command to open oil in the current file's directory
      vim.api.nvim_create_user_command('Ex', function()
        require('oil').open(vim.fn.expand '%:p:h')
      end, { desc = "Open oil in the current file's directory" })
    end,
  },
  -- For code screenshots
  {
    'michaelrommel/nvim-silicon.nvim',
    url = 'git@github.com:michaelrommel/nvim-silicon.git',
    lazy = true,
    cmd = 'Silicon',
    main = 'nvim-silicon',
    opts = {
      font = 'JetBrains Mono=16',
      theme = 'Visual Studio Dark+',
      -- YC blue
      background = '#0282E8',
      to_clipboard = true,
      pad_horiz = 20,
      window_title = function()
        -- Get path to current file
        local filepath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':p')
        filepath = string.gsub(filepath, '/Users/carltonbrady', '~')
        return filepath
      end,
      pad_vert = 20,
    },
  },
}
