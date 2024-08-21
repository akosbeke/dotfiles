return {
  "FabijanZulj/blame.nvim",
  config = function()
    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>tb",
      ":BlameToggle virtual<CR>",
      { silent = true, noremap = true, desc = "Toggle the git blame window" }
    )

    require("blame").setup()
  end,
}
