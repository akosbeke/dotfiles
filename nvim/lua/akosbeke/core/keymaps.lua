vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Reselect visual selection after indenting
keymap.set("v", "<", "<gv", { desc = "Increase indent" })
keymap.set("v", ">", ">gv", { desc = "Decrease indent" })

-- Open the current file in the default program (on Mac I think this is just `open`)
keymap.set("n", "<leader>oo", ":!open %<cr><cr>", { desc = "Open file in default program" })

-- Run the eslint fixer
keymap.set("n", "efa", ":EslintFixAll<cr>", { desc = "Eslint fix all" })

-- List git conflicts
keymap.set("n", "<leader>cl", ":GitConflictListQf<cr>", { desc = "" })

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Disable Q
keymap.set("n", "Q", "<nop>")
keymap.set("n", "q", "<nop>")

-- Search replace on current word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "" })
keymap.set("v", "<leader>s", [[y<Esc>:%s/<C-R>"//g<Left><Left>]], { desc = "" })

-- close quickfix menu after selecting choice
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
})

-- Next and previous buffer
keymap.set("n", "<leader>B", ":bprev<cr>", { desc = "Previous buffer" })
keymap.set("n", "<leader>b", ":bnext<cr>", { desc = "Next buffer" })

-- Open lazygit floating
keymap.set("n", "<leader>lg", ":LazyGit<cr>", { desc = "Open floating LazyGit" })

-- Clear all buffers except the current one
keymap.set("n", "<leader>cb", ":%bd|e3#<cr>", { desc = "Clear all buffers except the current one" })
