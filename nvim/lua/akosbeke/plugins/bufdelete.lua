return {
  "famiu/bufdelete.nvim",
  config = function()
    vim.keymap.set("n", "<Leader>q", ":Bdelete<CR>", { desc = "Quit current buffer" })
    vim.keymap.set("n", "<Leader>Q", ":bufdo Bdelete<CR>", { desc = "Quit each buffer" })
  end,
}
