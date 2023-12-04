return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      pickers = {
        buffers = {
          initial_mode = "normal",
        },
      },
      defaults = {
        path_display = {
          "smart",
          "absolute",
        },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
    keymap.set("n", "<leader>gf", builtin.git_files, { desc = "List git files" })
    keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Find text (grep)" })
    keymap.set("n", "<leader>ps", builtin.grep_string, { desc = "Find hightlighted text" })
    keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Find buffers" })
  end,
}
