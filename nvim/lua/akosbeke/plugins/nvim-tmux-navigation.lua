return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local keymap = vim.keymap

    keymap.set(
      "n",
      "<C-h>",
      ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>",
      { noremap = true, silent = true, desc = "Move to the left" }
    )
    keymap.set(
      "n",
      "<C-j>",
      ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>",
      { noremap = true, silent = true, desc = "Move down" }
    )
    keymap.set(
      "n",
      "<C-k>",
      ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>",
      { noremap = true, silent = true, desc = "Move up" }
    )
    keymap.set(
      "n",
      "<C-l>",
      ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>",
      { noremap = true, silent = true, desc = "Move to the right" }
    )
    keymap.set(
      "n",
      "<C-\\>",
      ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>",
      { noremap = true, silent = true, desc = "Move to the last active panel" }
    )
    keymap.set(
      "n",
      "<C-Space>",
      ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>",
      { noremap = true, silent = true, desc = "Move to the next panel" }
    )
  end,
}
