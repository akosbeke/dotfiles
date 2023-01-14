vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#504945", nocombine = true })

require('indent_blankline').setup {
    filetype_exclude = {
        'help',
        'terminal',
        'dashboard',
        'packer',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
    },
    buftype_exclude = { 'terminal', 'NvimTree' },
    --show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        -- "IndentBlanklineIndent2",
        -- "IndentBlanklineIndent3",
        -- "IndentBlanklineIndent4",
        -- "IndentBlanklineIndent5",
        -- "IndentBlanklineIndent6",
    },
}
