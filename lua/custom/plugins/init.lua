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
  { 'm4xshen/autoclose.nvim', opts = {} },
}
