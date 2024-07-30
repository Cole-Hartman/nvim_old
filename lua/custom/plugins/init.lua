-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Center the header (cat ASCII art)
      local header = {
        '          ⟋|､         ',
        '         (°､ ｡ 7       ',
        '         |､  ~ヽ       ',
        '         じしf_,)〳    ',
      }

      dashboard.section.header.val = header
      dashboard.section.header.opts.hl = 'AlphaHeader'

      -- Simplified button configuration
      dashboard.section.buttons.val = {
        dashboard.button('s f', '  Find Files', ':Telescope find_files<CR>'),
        dashboard.button('s w', '  Find Word', ':Telescope live_grep<CR>'),
      }

      -- Set up the config
      dashboard.config.layout = {
        { type = 'padding', val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
        dashboard.section.header,
        { type = 'padding', val = 5 },
        dashboard.section.buttons,
        { type = 'padding', val = 3 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)
    end,
  },
}
