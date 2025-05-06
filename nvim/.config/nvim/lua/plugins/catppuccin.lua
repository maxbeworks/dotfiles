return {
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
      custom_highlights = {
        CursorLineNr = { fg = "#fab387", bold = true },
        LineNr = { fg = "#9399b2" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
