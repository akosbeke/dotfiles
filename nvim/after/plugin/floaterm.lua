vim.keymap.set('n', 'ft', ':FloatermToggle scratch<CR>')
vim.keymap.set('t', 'ft', '<C-\\><C-n>:FloatermToggle scratch<CR>')

vim.g.floaterm_gitcommit = 'floaterm'
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_wintitle = 0