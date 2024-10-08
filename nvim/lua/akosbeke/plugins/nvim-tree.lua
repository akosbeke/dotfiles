return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { { "kyazdani42/nvim-web-devicons" } },
  config = function()
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#30323E" })

    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      reload_on_bufenter = true,
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        highlight_opened_files = "all",
        group_empty = true,
        icons = {
          show = {
            folder = false,
            folder_arrow = false,
          },
        },
      },
      view = {
        width = "40%",
        side = "right",
        relativenumber = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
    })

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>f",
      ":NvimTreeFindFileToggle<CR>",
      { silent = true, noremap = true, desc = "Toggle file explorer" }
    )

    local function open_nvim_tree()
      -- open the tree
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end,
}
