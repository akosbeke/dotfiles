require("gruvbox").setup({
    overrides = {
        Normal = { bg = 'None' }
    }
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd.colorscheme("gruvbox")
