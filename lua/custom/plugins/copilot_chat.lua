return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = '<C-s>',
          insert = '<C-s>',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-m>',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        show_diff = {
          normal = '<leader>Cd',
        },
        show_system_prompt = {
          normal = '<leader>Cp',
        },
        show_user_selection = {
          normal = '<leader>Cs',
        },
      },
    },
    config = function(_, opts)
      require('CopilotChat').setup(opts)
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        group = vim.api.nvim_create_augroup('copilot-chat-buf-enter', { clear = true }),
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          require('which-key').register {
            ['<leader>Cd'] = { name = '[C]opilot [D]iff', _ = 'which_key_ignore', buffer = bufnr },
            ['<leader>Cp'] = { name = '[C]opilot [P]rompt', _ = 'which_key_ignore', buffer = bufnr },
            ['<leader>Cs'] = { name = '[C]opilot [S]election', _ = 'which_key_ignore', buffer = bufnr },
          }
        end,
      })
    end,
    keys = {
      {
        '<leader>C',
        desc = '[C]opilot',
      },
      {
        '<leader>Cq',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = '[C]opilotChat [Q]uick Chat',
      },
      -- add keybinding for opening chat
      {
        '<leader>Co',
        function()
          require('CopilotChat').open()
        end,
        desc = '[C]opilotChat [O]pen',
      },
    },
  },
}
