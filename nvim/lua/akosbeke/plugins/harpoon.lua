return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependecies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local utils = require("telescope.utils")
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     local shortened_path = utils.transform_path({}, item.value)
    --     table.insert(file_paths, shortened_path)
    --   end

    --   require("telescope.pickers")
    --     .new({}, {
    --       prompt_title = "Harpoon",
    --       finder = require("telescope.finders").new_table({
    --         results = file_paths,
    --       }),
    --       previewer = conf.file_previewer({}),
    --       sorter = conf.generic_sorter({}),
    --       path_display = {
    --         "smart",
    --         "absolute",
    --       },
    --     })
    --     :find()
    -- end

    local keymap = vim.keymap

    -- keymap.set("n", "<leader>htl", function()
    --   toggle_telescope(harpoon:list())
    -- end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():append()
    end, { desc = "Add file to harpoon" })

    vim.keymap.set("n", "<leader>hl", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon quick list" })

    vim.keymap.set("n", "<leader>hc", function()
      harpoon:list():clear()
    end, { desc = "Clears the harpoon list" })

    keymap.set(
      "n",
      "<leader>hd",
      '<cmd>lua require("harpoon.mark").rm_file()<cr>',
      { noremap = true, silent = true, desc = "Remove file from Harpoon" }
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
