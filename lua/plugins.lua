lvim.plugins = {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- don't delete, otherwise it goes boom
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
    }
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("oil").setup({
        default_file_explorer = false,
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
        },
        win_options = {
          wrap = true,
        }
      })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      require("plugins.harpoon")
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    config = function()
      require("plugins.render-markdown")
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  },
  {
    -- This provides latex support to MeanderingProgrammer/render-markdown.nvim
    'ryleelyman/latex.nvim',
    config = function()
      require('latex').setup({})
    end,
  },
 'tpope/vim-surround',
}



