return {

  -- Splash Screen
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      local header = {
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠞⢳⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠋⠀⢰⠎⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢆⣤⡞⠃⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢠⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⢀⣀⣾⢳⠀⠀⠀⠀⢸⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⣀⡤⠴⠊⠉⠀⠀⠈⠳⡀⠀⠀⠘⢎⠢⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀',
        '⠳⣄⠀⠀⡠⡤⡀⠀⠘⣇⡀⠀⠀⠀⠉⠓⠒⠺⠭⢵⣦⡀⠀⠀⠀',
        '⠀⢹⡆⠀⢷⡇⠁⠀⠀⣸⠇⠀⠀⠀⠀⠀⢠⢤⠀⠀⠘⢷⣆⡀⠀',
        '⠀⠀⠘⠒⢤⡄⠖⢾⣭⣤⣄⠀⡔⢢⠀⡀⠎⣸⠀⠀⠀⠀⠹⣿⡀',
        '⠀⠀⢀⡤⠜⠃⠀⠀⠘⠛⣿⢸⠀⡼⢠⠃⣤⡟⠀⠀⠀⠀⠀⣿⡇',
        '⠀⠀⠸⠶⠖⢏⠀⠀⢀⡤⠤⠇⣴⠏⡾⢱⡏⠁⠀⠀⠀⠀⢠⣿⠃',
        '⠀⠀⠀⠀⠀⠈⣇⡀⠿⠀⠀⠀⡽⣰⢶⡼⠇⠀⠀⠀⠀⣠⣿⠟⠀',
        '⠀⠀⠀⠀⠀⠀⠈⠳⢤⣀⡶⠤⣷⣅⡀⠀⠀⠀⣀⡠⢔⠕⠁⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠫⠿⠿⠿⠛⠋⠁⠀⠀⠀⠀',
      }

      dashboard.section.header.val = header
      dashboard.section.header.opts.hl = 'AlphaHeader'

      -- Simplified button configuration
      dashboard.section.buttons.val = {
        dashboard.button('a', '  All Files', ':Telescope find_files<CR>'),
        dashboard.button('o', '  Old Files', ': Telescope oldfiles <cr>'),
        dashboard.button('r', '  Restore', [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button('q', '  Quit', '<cmd> qa <cr>'),
      }

      alpha.setup(dashboard.config)
    end,
  },

  -- Transparent Nvim
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup {
        groups = { -- default groups
          'Normal',
          'NormalNC',
          'Comment',
          'Constant',
          'Special',
          'Identifier',
          'Statement',
          'PreProc',
          'Type',
          'Underlined',
          'Todo',
          'String',
          'Function',
          'Conditional',
          'Repeat',
          'Operator',
          'Structure',
          'LineNr',
          'NonText',
          'SignColumn',
          'CursorLine',
          'CursorLineNr',
          'StatusLine',
          'StatusLineNC',
          'EndOfBuffer',
        },
        extra_groups = {
          'NormalFloat', -- plugins with float panels
          'NvimTreeNormal', -- NvimTree
        },
        exclude_groups = {}, -- groups you don't want to clear
      }
    end,
  },

  -- Persistance Plugin
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  -- Toggle Term Plugin
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        -- customization
        shade_terminals = false,
        open_mapping = [[<c-\>]],
        autochdir = false,
      }

      -- keymaps
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end
    end,
  },

  -- Markdown Preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  -- vim tmux navigator
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  -- Live Server
  {
    'barrett-ruth/live-server.nvim',
    build = 'npm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = function()
      require('live-server').setup {
        port = 8080,
        root = vim.fn.expand '%:p:h',
        open = true,
        file = 'index.html',
        css = true,
        js = true,
        host = '127.0.0.1',
      }
    end,
  },

  -- vim be good
  {
    'ThePrimeagen/vim-be-good',
  },

  -- neorg
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      { 'pysan3/neorg-templates', dependencies = { 'L3MON4D3/LuaSnip' } },
    },
    config = function()
      vim.opt.conceallevel = 2
      vim.opt.foldenable = false -- Disable folding by default

      -- global keybinds
      vim.keymap.set('n', '<leader>a', '<cmd>Neorg workspace home<CR>', { desc = 'Neorg home' })

      -- keybinds when in .norg file
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'norg',
        callback = function()
          vim.keymap.set('n', '<leader>a', '<cmd>Neorg workspace home<CR>', { desc = 'Neorg home' })
          vim.keymap.set('n', '<leader>1', '<cmd>Neorg workspace dsa<CR>', { buffer = true, desc = 'Switch to DSA workspace' })
          vim.keymap.set('n', '<leader>2', '<cmd>Neorg workspace class<CR>', { buffer = true, desc = 'Switch to class workspace' })
          vim.keymap.set('n', '<leader>3', '<cmd>Neorg workspace internship<CR>', { buffer = true, desc = 'Switch to internship workspace' })
        end,
      })

      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
              icon_preset = 'diamond',
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                home = '~/neorg/home/',
                dsa = '~/neorg/dsa/',
                class = '~/neorg/class/',
                internship = '~/neorg/internship/',
              },
            },
          },
          ['core.integrations.treesitter'] = {
            config = {
              configure_parsers = true,
              fold_markers = {
                enabled = false, -- Disable automatic folding
              },
            },
          },
          ['external.templates'] = {
            config = {
              templates_dir = '~/neorg/templates',
            },
          },
        },
      }
    end,
  },
}
