return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    { "<leader>h", false },
    {
      "<leader>fh",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Quick Menu",
    },
    {
      "<leader>hh",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Quick Menu",
    },
    {
      "<leader>ha",
      function()
        local harpoon = require("harpoon")
        harpoon:list():add()
      end,
      desc = "Add to Harpoon",
    },
    {
      "<leader>hr",
      function()
        local harpoon = require("harpoon")
        harpoon:list():remove()
      end,
      desc = "Remove from Harpoon",
    },
    {
      "<leader>hc",
      function()
        local harpoon = require("harpoon")
        harpoon:list():clear()
      end,
      desc = "Clear all Harpoon marks",
    },
  },
}
