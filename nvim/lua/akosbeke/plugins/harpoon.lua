return {
  "ThePrimeagen/harpoon",
  dependecies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("harpoon").setup({})
    require("telescope").load_extension("harpoon")

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>hl",
      "<cmd>Telescope harpoon marks initial_mode=normal<cr>",
      { noremap = true, silent = true, desc = "Show Harpoon" }
    )
    keymap.set(
      "n",
      "<leader>ha",
      '<cmd>lua require("harpoon.mark").add_file()<cr>',
      { noremap = true, silent = true, desc = "Add file to Harpoon" }
    )
    keymap.set(
      "n",
      "<leader>hd",
      '<cmd>lua require("harpoon.mark").rm_file()<cr>',
      { noremap = true, silent = true, desc = "Remove file from Harpoon" }
    )
    keymap.set(
      "n",
      "<leader>hc",
      '<cmd>lua require("harpoon.mark").clear_all()<cr>',
      { noremap = true, silent = true, desc = "Clear all files in Harpoon" }
    )
    keymap.set(
      "n",
      "]]",
      '<cmd>lua require("harpoon.ui").nav_next()<cr>',
      { noremap = true, silent = true, desc = "Next file in Harpoon" }
    )
    keymap.set(
      "n",
      "[[",
      '<cmd>lua require("harpoon.ui").nav_prev()<cr>',
      { noremap = true, silent = true, desc = "Previous file in Harpoon" }
    )
  end,
}
