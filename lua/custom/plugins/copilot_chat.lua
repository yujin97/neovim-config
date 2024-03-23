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
        callback = function()
          -- add description for which-key plugin
          require('which-key').register({
            C = {
              name = '[C]opilot',
              d = 'Show diff',
              p = 'Show system prompt',
              s = 'Show user selection',
            },
          }, { prefix = '<leader>' })
        end,
      })
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
