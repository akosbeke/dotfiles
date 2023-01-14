vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = 'NvimTree',
                text = '  Files',
                highlight = 'BufferlineOffset',
                text_align = 'left',
            }
        },
    }
}

vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<space><A-h>', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', '<space><A-l>', ':BufferLineMoveNext<CR>')
