return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false, -- No panel, dont mess with my lsp
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true, -- Hide when cmp is active
        debounce = 500, -- Higher debounce so it is not fucking annoying, default is 75
        keymap = {
          accept = false, -- Handling this with nvim cmp
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = "node",
      server_opts_overrides = {},
    })
  end,
}
