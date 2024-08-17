return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
      overrides = {
        CursorLine = { bg = "#504945" },
      },
    })
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
  end,
}
