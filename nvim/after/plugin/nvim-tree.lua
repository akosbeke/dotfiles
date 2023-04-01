require("nvim-tree").setup {
    reload_on_bufenter = true,
    git = {
        enable = true,
        ignore = false,
    },
    renderer = {
        indent_markers = {
            enable = true
        },
        highlight_opened_files = 'all',
        group_empty = true,
        icons = {
            show = {
                folder = false,
                folder_arrow = false
            }
        }
    },
    view = {
        width = '20%',
        side = 'right',
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
    },

}

vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#30323E"  })

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':NvimTreeFocus<CR>', { silent = true, noremap = true })
