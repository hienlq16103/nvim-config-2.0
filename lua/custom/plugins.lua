local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts  = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format",
        "python-lsp-server",
        "haskell-language-server",
        "deno",
        "jdtls",
        "intelephense",
        "sqlls",
        "omnisharp",
        "omnisharp-mono",
        "css-lsp",
        "texlab",
        "taplo",
        "markdown-oxide",
        "codelldb",
      }
    }
  },-- Lazy
  {
    'dgagn/diagflow.nvim',
    enabled = false,
    event = 'LspAttach',
    opts = function ()
      return require('custom.configs.diagflow')
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "3.5.4",
    main = "ibl",
    config = function ()
      require('custom.configs.indent-blankline')
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function ()
      require('nvim-ts-autotag').setup()
    end,
    ft = function ()
      return require('custom.filetype.nvim-ts-autotag')
    end
  },
  {
    "Nvchad/nvterm",
    config = function ()
      require("nvterm").setup({
        terminals = {
          shell = "PowerShell.exe",
        }
      })
    end
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "cohama/lexima.vim",
    lazy = false,
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function (_, _)
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "mfussenegger/nvim-dap",
  --   },
  --   opts = {
  --     handlers = {}
  --   }
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "nvim-neotest/nvim-nio"
  --   },
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end
  -- },
}
return plugins
