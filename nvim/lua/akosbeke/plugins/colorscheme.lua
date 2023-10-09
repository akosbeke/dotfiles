return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("gruvbox").setup({
      overrides = {
        Normal = { bg = "None" },
      },
    })
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
  end,
}
