require("noice").setup({
  lsp = {
    -- override markdown rendering so that *cmp* and other plugins use *Treesitter*
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    }
  },
  cmdline = {
    format = {
      search_down = {
        view = "cmdline",
      },
      search_up = {
        view = "cmdline",
      },
    },
  },
  notify = {
    enabled = true,
    view = "notify",
    replace = true
  },
  presets = {
    -- bottom_search = true, -- use a classic bottom cmdline for search
    -- command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
  },
})

lvim.builtin.lualine.sections.lualine_x = {
  {
    require("noice").api.statusline.mode.get,
    cond = require("noice").api.statusline.mode.has,
    color = { fg = "#ff9e64" },
  }
}
