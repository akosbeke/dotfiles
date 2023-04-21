local builtin = require('telescope.builtin')

require('telescope').setup {
    pickers = {
        buffers = {
            initial_mode = "normal",
        }
    }
}

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
