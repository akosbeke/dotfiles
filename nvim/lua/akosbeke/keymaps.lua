vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Open the current file in the default program (on Mac I think this is just `open`)
vim.keymap.set('n', '<leader>oo', ':!open %<cr><cr>')

-- Run the eslint fixer 
vim.keymap.set('n', 'efa', ':EslintFixAll<cr>')

-- List git conflicts
vim.keymap.set('n', '<leader>cl', ':GitConflictListQf<cr>')

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Disable Q 
vim.keymap.set("n", "Q", "<nop>")

-- Search replace on current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [[y<Esc>:%s/<C-R>"//g<Left><Left>]])

-- close quickfix menu after selecting choice
vim.api.nvim_create_autocmd(
  "FileType", {
  pattern={"qf"},
  command=[[nnoremap <buffer> <CR> <CR>:cclose<CR>]]})

-- Next and previous buffer
vim.keymap.set('n', '<leader>B', ':bprev<cr>')
vim.keymap.set('n', '<leader>b', ':bnext<cr>')

-- Open git status via fugitive
vim.keymap.set('n', '<leader>gs', ':G<cr>')
-- Open git blame via fugitive
vim.keymap.set('n', '<leader>gb', ':G blame<cr>')
-- Open lazygit floating
vim.keymap.set('n', '<leader>lg', ':LazyGit<cr>')
