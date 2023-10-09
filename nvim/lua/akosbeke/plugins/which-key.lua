return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    vim.keymap.set("n", "<leader>wk", "<cmd>WhichKey<CR>", { silent = true, desc = "Open WhichKey menu" })
  end,
  opts = {},
}
