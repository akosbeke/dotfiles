vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Reselect visual selection after indenting
keymap.set("v", "<", "<gv", { desc = "Increase indent" })
keymap.set("v", ">", ">gv", { desc = "Decrease indent" })

-- Open the current file in the default program (on Mac I think this is just `open`)
keymap.set("n", "<leader>oo", ":!open %<cr><cr>", { desc = "Open file in default program" })

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

-- Search replace on current word
keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace" })
keymap.set("v", "<leader>S", [[y<Esc>:%s/<C-R>"//g<Left><Left>]], { desc = "Search and replace" })

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

keymap.set("n", "<leader>Q", ":wq<cr>", { desc = "Save file and quit buffer" })
keymap.set("v", "<leader>Q", ":wq<cr>", { desc = "Save file and quit buffer" })
keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save file" })
keymap.set("v", "<leader>w", ":w<cr>", { desc = "Save file" })

-- Splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
