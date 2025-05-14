return {
  "neovim/nvim-lspconfig",
  -- config = function()
  --   local lspconfig = require("lspconfig")
  --   lspconfig.sourcekit.setup({})
  -- end,
  opts = {
    autoformat = false,
    -- servers = {
    --   sourcekit = {
    --     cmd = { "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp" },
    --   },
    -- },
  },
}
